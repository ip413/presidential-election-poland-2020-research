set key noautotitle
set datafile separator comma
set pointsize 0.5

set terminal png small size 640, 480
set output 'charts/results-official-vs-polling-stations-with-all-votes-valid.png'

set xtic rotate
# set yrange [0:0.3]

set title "Official results vs polling stations with all votes valid"

set style fill solid
set boxwidth 0.4

plot "sql-queries/06-official-vs-polling-stations-all-votes-valid-transposed.csv" \
    using 2:xtic(1) \
    title "official" \
    with boxes, \
    "" using ($0 + 0.4):3 \
    title "all valid" \
    with boxes