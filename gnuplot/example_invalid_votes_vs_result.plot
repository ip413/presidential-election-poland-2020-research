set key noautotitle
set datafile separator comma
set pointsize 0.5
set terminal png small size 640, 480
set output 'charts/invalid_votes_as_function_duda_result.png'

set title "Invalid votes as function of Duda result"
set ylabel "Invalid votes [%]"
set xlabel "Result [%]"

# print chart with columns 52 (wynik_duda_proc) and 33 (glosy_niewazne_proc)
plot 'data-round-1-converted/data.csv' using 52:33

# show chart, despite the fact it was saved by terminal png
set terminal x11
set output
replot