set key noautotitle
set datafile separator comma
set pointsize 0.5

set title "Duda result as a function of invalid votes"
set ylabel "Invalid votes [%]"
set xlabel "Result [%]"

f(x)=a*x**b
fit f(x) 'data-round-1-converted/data.csv' using 52:33 via a, b

set label GPFUN_f at graph .1, 0.95
set label sprintf("a = %g",a) at graph .1,.9
set label sprintf("b = %g",b) at graph .1,.85

plot 'data-round-1-converted/data.csv' using 52:33, f(x) title "power-trendline"