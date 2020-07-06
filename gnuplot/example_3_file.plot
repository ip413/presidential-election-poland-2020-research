set key noautotitle
set datafile separator comma
set pointsize 0.5

set terminal png small size 640, 480
set output 'temp/invalid_votes_as_function_duda_result.png'

set title "Duda result as a function of invalid votes"
set ylabel "Invalid votes [%]"
set xlabel "Result [%]"

plot 'data-round-1-converted/data.csv' using 52:33