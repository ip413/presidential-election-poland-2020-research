/**
 * Script takes arguments:
 * --colX  - column 1 name {String}
 * --colY  - column 2 name {String}
 * --trend-linear - print linear trend line, any value allowed {Any}
 * --stats - calculate stats, any value allowed {Any}
 * --show-chart - by default chart is save to png file, if option is present chart will be also shown, any value allowed {Any}
 */

const fs = require('fs');
const { argv } = require('yargs');
const { exec } = require("child_process");

const columns_number = require('./columns_number.json');

const colX = argv.colX;
const colY = argv.colY;

const title =  `${colX} vs ${colY}`;
const xlabel =  `${colX}`;
const ylabel =  `${colY}`;

const colXIndex = columns_number[colX];
const colYIndex = columns_number[colY];

const showChart = !!argv['show-chart'];
const showChartCommand = `set terminal x11
set output
replot`;

const trendLinear = !!argv['trend-linear'];
const trendLinearCommand = `
f(x) = m*x + b;
fit f(x)  'data-round-1-converted/data.csv' using ${colXIndex}:${colYIndex} via m,b
`;

const stats = !!argv.stats;
const statsCommand = `stats 'data-round-1-converted/data.csv' using ${colXIndex}:${colYIndex}`

const template = `
set key noautotitle
set datafile separator comma
set pointsize 0.5
set terminal png small size 640, 480
set output 'charts/${colX}_as_function_${colY}${trendLinear ? '_trend-linear' : ''}.png'

set title "${title.replace(/_/g, '-')}"
set ylabel "${ylabel.replace(/_/g, '-')}"
set xlabel "${xlabel.replace(/_/g, '-')}"

${stats ? statsCommand : ''}
${trendLinear ? trendLinearCommand : ''}
plot 'data-round-1-converted/data.csv' using ${colXIndex}:${colYIndex} ${trendLinear ? ', f(x)' : ''}

${showChart ? showChartCommand : ''}
`;

fs.writeFileSync('temp/gnuplot.plot', template);
exec('gnuplot -p temp/gnuplot.plot', (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
});