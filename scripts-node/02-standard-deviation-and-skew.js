const fs = require('fs');
const csv2json = require('csvtojson');
const stats = require('stats-lite');
const skewness = require('just-skewness');

// const DATA_FILE_PATH = 'sql-queries/10-results-from-polling-stations-with-the-same-address-DEV-SAMPLE.csv';
const DATA_FILE_PATH = 'sql-queries/10-results-from-polling-stations-with-the-same-address.csv';

let dataJson;
const pollingStationsMap = {};
const sortedByStandardDeviationDesc = [];
let sortedByStandardDeviationAsc;

let sortedBySkewDesc;
let sortedBySkewAsc;

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
    saveResultsToFiles();
    return new Promise(() => { });
}

function saveResultsToFiles() {
    fs.writeFileSync('scripts-node-results/02-standard-deviation-desc.json', JSON.stringify(sortedBySkewDesc, null, 4));
    fs.writeFileSync('scripts-node-results/02-standard-deviation-asc.json', JSON.stringify(sortedBySkewAsc, null, 4));

    fs.writeFileSync('scripts-node-results/02-skew-standard-deviation-desc.json', JSON.stringify(sortedBySkewDesc, null, 4));
    fs.writeFileSync('scripts-node-results/02-skew-standard-deviation-asc.json', JSON.stringify(sortedBySkewAsc, null, 4));

    fs.writeFileSync('scripts-node-results/02-standard-deviation-address-desc.json', JSON.stringify(sortedByStandardDeviationDesc.map(value => value.siedziba), null, 4));
    fs.writeFileSync('scripts-node-results/02-standard-deviation-address-asc.json', JSON.stringify(sortedByStandardDeviationAsc.map(value => value.siedziba), null, 4));

    fs.writeFileSync('scripts-node-results/02-skew-standard-deviation-address-desc.json', JSON.stringify(sortedBySkewDesc.map(value => value.siedziba), null, 4));
    fs.writeFileSync('scripts-node-results/02-skew-standard-deviation-address-asc.json', JSON.stringify(sortedBySkewAsc.map(value => value.siedziba), null, 4));
}

/**
 * Pearson's second skewness coefficient makes sense only for at least three values
 */
function filterAndSortBySkew() {
    sortedBySkewDesc = sortedBySkewDesc.filter(value => value.duda.length > 2);
    sortedBySkewAsc = sortedBySkewAsc.filter(value => value.duda.length > 2);

    sortedBySkewDesc = sortedBySkewDesc.sort((a, b) => {
        return b.skews_stdev - a.skews_stdev;
    });

    sortedBySkewAsc = sortedBySkewAsc.sort((a, b) => {
        return a.skews_stdev - b.skews_stdev;
    });
}

function splitResultsToDescAndAsc() {
    sortedByStandardDeviationAsc = sortedByStandardDeviationDesc.slice(-1 + Math.floor(sortedByStandardDeviationDesc.length / 2)).reverse();
    sortedByStandardDeviationDesc.splice(Math.ceil(sortedByStandardDeviationDesc.length / 2));

    sortedBySkewAsc = sortedBySkewDesc.slice(-1 + Math.floor(sortedBySkewDesc.length / 2)).reverse();
    sortedBySkewDesc.splice(Math.ceil(sortedBySkewDesc.length / 2));
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

function sortByStandardDeviation() {
    for (let [key, value] of Object.entries(pollingStationsMap)) {
        sortedByStandardDeviationDesc.push(value);
        value.id = key;
    }

    sortedByStandardDeviationDesc.sort((a, b) => {
        return b.sum_stdev - a.sum_stdev;
    });
}

function sortBySkew() {
    sortedBySkewDesc = [];
    for (let [key, value] of Object.entries(pollingStationsMap)) {
        sortedBySkewDesc.push(value);
        value.id = key;
    }

    sortedBySkewDesc.sort((a, b) => {
        return b.skews_stdev - a.skews_stdev;
    });
}


function calcStandardDeviationAndSkew() {
    for (let [key, value] of Object.entries(pollingStationsMap)) {

        value.duda_stdev = stats.stdev(pollingStationsMap[key].duda);
        value.duda_stdev_percent_of_mean = 100 * value.duda_stdev / stats.mean(pollingStationsMap[key].duda);

        value.trzaskowski_stdev = stats.stdev(pollingStationsMap[key].trzaskowski);
        value.trzaskowski_stdev_percent_of_mean = 100 * value.trzaskowski_stdev / stats.mean(pollingStationsMap[key].trzaskowski);

        value.holownia_stdev = stats.stdev(pollingStationsMap[key].holownia);
        value.holownia_stdev_percent_of_mean = 100 * value.holownia_stdev / stats.mean(pollingStationsMap[key].holownia);

        value.bosak_stdev = stats.stdev(pollingStationsMap[key].bosak);
        value.bosak_stdev_percent_of_mean = 100 * value.bosak_stdev / stats.mean(pollingStationsMap[key].bosak);

        value.kosiniak_stdev = stats.stdev(pollingStationsMap[key].kosiniak);
        value.kosiniak_stdev_percent_of_mean = 100 * value.kosiniak_stdev / stats.mean(pollingStationsMap[key].kosiniak);

        let skews = [];
        pollingStationsMap[key].duda.forEach((dudaValue, index) => {

            let skew = skewness(+pollingStationsMap[key].duda[index],
                +pollingStationsMap[key].trzaskowski[index],
                +pollingStationsMap[key].holownia[index],
                +pollingStationsMap[key].bosak[index],
                +pollingStationsMap[key].kosiniak[index]);
            skews.push(skew);
        });

        value.skews = skews;
        value.skews_stdev = stats.stdev(skews);
        value.sum_stdev = value.duda_stdev + value.trzaskowski_stdev + value.holownia_stdev + value.bosak_stdev + value.kosiniak_stdev;
    }
}

function makePollingStationMap() {
    dataJson.forEach(value => {
        // happy assumption that addresses are unique
        let id = value.siedziba.replace(/[^A-Za-z0-9ążźćńłóęśĄŻŹĆŃŁÓĘŚ]/g, '');
        value.id = id;
        if (!pollingStationsMap[id]) {
            pollingStationsMap[id] = {
                duda: [value.wynik_duda_proc],
                trzaskowski: [value.wynik_trzaskowski_proc],
                holownia: [value.wynik_holownia_proc],
                bosak: [value.wynik_bosak_proc],
                kosiniak: [value.wynik_kosiniak_proc]
            };
        } else {
            pollingStationsMap[id].duda.push(value.wynik_duda_proc);
            pollingStationsMap[id].trzaskowski.push(value.wynik_trzaskowski_proc);
            pollingStationsMap[id].holownia.push(value.wynik_holownia_proc);
            pollingStationsMap[id].bosak.push(value.wynik_bosak_proc);
            pollingStationsMap[id].kosiniak.push(value.wynik_kosiniak_proc);
        }
    });
}

async function dataToJson() {
    return csv2json().fromFile(DATA_FILE_PATH).then((jsonObj) => {
        return jsonObj;
    });
};