set key noautotitle
set datafile separator comma
set pointsize 0.5

set title "Duda result (invalid votes)"

set ylabel "Number of invalid votes [%]"
set xlabel "Duda result [%]"

plot 'data-round-1-converted/data.csv' using 52:33 