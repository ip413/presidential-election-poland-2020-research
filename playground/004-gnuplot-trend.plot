set key noautotitle
set datafile separator comma
set pointsize 0.5

set title "Duda result as a function of invalid votes"
set ylabel "Invalid votes [%]"
set xlabel "Result [%]"

f(x) = m*x + b;
fit f(x)  'data-round-1-converted/data.csv' using 52:33 via m,b
plot 'data-round-1-converted/data.csv' using 52:33, f(x)