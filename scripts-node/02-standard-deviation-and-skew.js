const fs = require('fs');
const csv2json = require('csvtojson');
const stats = require('stats-lite');
const skewness = require('just-skewness');

const DEV_DATA = false;

const DATA_FILE_PATH = `sql-queries/10-results-from-polling-stations-with-the-same-address${DEV_DATA ? '-DEV-SAMPLE': ''}.csv`;
const CANDIDATES = ['biedron', 'bosak', 'duda', 'holownia', 'jakubiak', 'kosiniak', 'piotrowski', 'tanajno', 'trzaskowski', 'witkowski', 'zoltek'];

let dataJson;
const pollingStationsMap = {};
const sortedByStandardDeviationDesc = [];
let sortedByStandardDeviationAsc;
let skewWeightedResult = {};
let skewWeightedStats = {};

main();

async function main() {
    dataJson = await dataToJson();
    makePollingStationMap();
    calcStandardDeviationAndSkew();

    sortByStandardDeviation();
    sortBySkew();

    addIdsToResult();
    splitResultsToDescAndAsc();
    filterAndSortBySkew();

    saveSkewFiles();

    saveResultsToFiles();
    // console.log(sortedBySkewDesc.reverse());
    // console.log(sortedBySkewDesc.length, sortedBySkewAsc.length);
    return new Promise(() => { });
}

function addIdsToResult() {
    sortedByStandardDeviationDesc.forEach(element => {
        dataJson.some((value) => {
            if (value.id === element.id) {
                element.siedziba = value.siedziba;
            }
        })
    });

    sortedBySkewDesc.forEach(element => {
        dataJson.some((value) => {
            if (value.id === element.id) {
                element.siedziba = value.siedziba;
            }
        })
    });
}


function saveSkewFiles() {
    CANDIDATES.forEach(candidate => {
        fs.writeFileSync(`scripts-node-results/02-skew-${candidate}-took-votes.json`, sanitizeAndStringify(skewWeightedResult[`${candidate}TookVotes`]));
        fs.writeFileSync(`scripts-node-results/02-skew-${candidate}-taken-from.json`, sanitizeAndStringify(skewWeightedResult[`${candidate}TakenFrom`]));
    });

    // fs.writeFileSync('scripts-node-results/temp.json', JSON.stringify(skewWeightedResult, null, 4));
    // fs.writeFileSync('scripts-node-results/temp-stats.json', JSON.stringify(skewWeightedStats, null, 4));

    for (let key in skewWeightedStats) {
        skewWeightedStats[key].id = key;
    }
    let statsArray = Object.values(skewWeightedStats);

    fs.writeFileSync('scripts-node-results/02-skew-stats-took-votes-sum-desc.json', JSON.stringify(statsArray.sort((a, b) => b.tookVotesSum - a.tookVotesSum), null, 4));
    fs.writeFileSync('scripts-node-results/02-skew-stats-took-votes-times-desc.json', JSON.stringify(statsArray.sort((a, b) => b.tookVotesTimes - a.tookVotesTimes), null, 4));

    fs.writeFileSync('scripts-node-results/02-skew-stats-taken-from-sum-asc.json', JSON.stringify(statsArray.sort((a, b) => a.takenFromSum - b.takenFromSum), null, 4));
    fs.writeFileSync('scripts-node-results/02-skew-stats-taken-from-times-desc.json', JSON.stringify(statsArray.sort((a, b) => b.takenFromTimes - a.takenFromTimes), null, 4));
}

function saveResultsToFiles() {
    fs.writeFileSync('scripts-node-results/02-skew-standard-deviation-desc.json', sanitizeAndStringify(sortedByStandardDeviationDesc));
    fs.writeFileSync('scripts-node-results/02-skew-standard-deviation-asc.json', sanitizeAndStringify(sortedByStandardDeviationDesc.reverse()));

    // fs.writeFileSync('scripts-node-results/02-standard-deviation-address-desc.json', JSON.stringify(sortedByStandardDeviationDesc.map(value => value.siedziba), null, 4));
    // fs.writeFileSync('scripts-node-results/02-standard-deviation-address-asc.json', JSON.stringify(sortedByStandardDeviationAsc.map(value => value.siedziba), null, 4));
}

function sanitizeAndStringify(obj) {
    if(obj.forEach) {
        obj.forEach(v => {
            delete v.stdev;
            delete v.skew;
            delete v.id;
        })
    }

    return JSON.stringify(obj, null, 4);
}

/**
 * Pearson's second skewness coefficient makes sense only for at least three values
 */
function filterAndSortBySkew() {
    let usefulForSkew = Object.entries(pollingStationsMap).map(v => v[1]).filter(value => value.duda.length > 2);

    CANDIDATES.forEach(candidate => {
        skewWeightedResult[`${candidate}TookVotes`] = usefulForSkew.filter(v => v.skewWeighted[candidate] > 0);
        skewWeightedResult[`${candidate}TookVotes`] = skewWeightedResult[`${candidate}TookVotes`].sort((a, b) => b.skewWeighted[candidate] - a.skewWeighted[candidate]);

        skewWeightedResult[`${candidate}TakenFrom`] = usefulForSkew.filter(v => v.skewWeighted[candidate] < 0);
        skewWeightedResult[`${candidate}TakenFrom`] = skewWeightedResult[`${candidate}TakenFrom`].sort((a, b) => a.skewWeighted[candidate] - b.skewWeighted[candidate]);
    });

    CANDIDATES.forEach(candidate => {
        skewWeightedStats[candidate] = {};
        skewWeightedStats[candidate].tookVotes = skewWeightedResult[`${candidate}TookVotes`].map(v => v.skewWeighted[candidate])
        skewWeightedStats[candidate].tookVotesSum = stats.sum(skewWeightedStats[candidate].tookVotes);
        skewWeightedStats[candidate].tookVotesTimes = skewWeightedStats[candidate].tookVotes.length;
        delete skewWeightedStats[candidate].tookVotes;

        skewWeightedStats[candidate].takenFrom = skewWeightedResult[`${candidate}TakenFrom`].map(v => v.skewWeighted[candidate])
        skewWeightedStats[candidate].takenFromSum = stats.sum(skewWeightedStats[candidate].takenFrom);
        skewWeightedStats[candidate].takenFromTimes = skewWeightedStats[candidate].takenFrom.length;
        delete skewWeightedStats[candidate].takenFrom;
    });

    


    // sortedBySkewAsc = sortedBySkewAsc.sort((a, b) => {
    //     return a.skews_stdev - b.skews_stdev;
    // });
}

function splitResultsToDescAndAsc() {
    sortedByStandardDeviationAsc = sortedByStandardDeviationDesc.slice(-1 + Math.floor(sortedByStandardDeviationDesc.length / 2)).reverse();
    sortedByStandardDeviationDesc.splice(Math.ceil(sortedByStandardDeviationDesc.length / 2));

    // sortedBySkewAsc = sortedBySkewDesc.slice().reverse();
    // sortedBySkewAsc = sortedBySkewDesc.slice(-1 + Math.floor(sortedBySkewDesc.length / 2)).reverse();
    // sortedBySkewDesc.splice(Math.ceil(sortedBySkewDesc.length / 2));
}

function sortByStandardDeviation() {
    for (let [key, value] of Object.entries(pollingStationsMap)) {
        sortedByStandardDeviationDesc.push(value);
        value.id = key;
    }

    sortedByStandardDeviationDesc.sort((a, b) => {
        return b.stdevSum - a.stdevSum;
    });
}

function sortBySkew() {
    sortedBySkewDesc = [];
    for (let [key, value] of Object.entries(pollingStationsMap)) {
        sortedBySkewDesc.push(value);
        value.id = key;
    }


    // console.log(sortedBySkewDesc.filter, Object.entries(pollingStationsMap).filter)

    sortedBySkewDesc.sort((a, b) => {
        return b.skewWeighted.duda - a.skewWeighted.duda;
    });
}

function calcStandardDeviationAndSkew() {
    for (let [key, value] of Object.entries(pollingStationsMap)) {

        value.stdev = {};
        CANDIDATES.forEach(candidate => {
            value.stdev[candidate + '_stdev'] = stats.stdev(pollingStationsMap[key][candidate]);
        });

        value.skew = {};
        CANDIDATES.forEach(candidate => {
            value.skew[candidate] = skewness(pollingStationsMap[key][candidate].map(v => +v));

            if (isNaN(value.skew[candidate])) {
                value.skew[candidate] = 0;
            }
        });

        value.skewWeighted = {};
        CANDIDATES.forEach(candidate => {
            value.skewWeighted[candidate] = value.skew[candidate] * stats.stdev(pollingStationsMap[key][candidate]);
        });

        value.stdevSkew = stats.stdev(Object.values(value.skew));
        value.stdevSum = stats.sum(Object.values(value.stdev));
    }
}

function makePollingStationMap() {
    dataJson.forEach(value => {
        // happy assumption that addresses are unique
        let id = value.siedziba.replace(/[^A-Za-z0-9ążźćńłóęśĄŻŹĆŃŁÓĘŚ]/g, '');
        value.id = id;
        if (!pollingStationsMap[id]) {
            pollingStationsMap[id] = {};
            CANDIDATES.forEach(candidate => {
                pollingStationsMap[id][candidate] = [+value[`wynik_${candidate}_proc`]]    
            });
        } else {
            CANDIDATES.forEach(candidate => {
                pollingStationsMap[id][candidate].push(+value[`wynik_${candidate}_proc`]);
            })
        }
    });
}

async function dataToJson() {
    return csv2json().fromFile(DATA_FILE_PATH).then((jsonObj) => {
        return jsonObj;
    });
};