# make chart and show
# no stats, not trend, no file saved

set key noautotitle
set datafile separator comma
set pointsize 0.5

set title "Duda result as a function of invalid votes"
set ylabel "Invalid votes [%]"
set xlabel "Result [%]"

plot 'data-round-1-converted/data.csv' using 52:33