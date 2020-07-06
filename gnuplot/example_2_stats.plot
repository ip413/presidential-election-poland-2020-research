# calc stats, make chart and show
# not trend, no file saved

set key noautotitle
set datafile separator comma
set pointsize 0.5

set title "Duda result as a function of invalid votes"
set ylabel "Invalid votes [%]"
set xlabel "Result [%]"

stats 'data-round-1-converted/data.csv' using 52:33

set label sprintf("records = %g",STATS_records) at 5, 25
set label sprintf("records invalid = %g",STATS_invalid) at 5, 26
set label sprintf("correlation = %g",STATS_correlation) at 5, 27
set label sprintf("slope = %g",STATS_slope) at 5, 28

plot 'data-round-1-converted/data.csv' using 52:33