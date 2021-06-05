set key noautotitle
set datafile separator comma
set pointsize 0.5

set terminal png small size 640, 480
set output 'charts/results-official-vs-average-2.png'

set xtic rotate
# set yrange [0:0.3]

set title "Official results vs average results"

set style fill solid
set boxwidth 0.4

plot "sql-queries/05-official-vs-average-transposed.csv" \
    using 2:xtic(1) \
    title "official" \
    with boxes, \
    "" using ($0 + 0.4):3 \
    title "average" \
    with boxes