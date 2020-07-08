set key noautotitle
set datafile separator comma
set pointsize 0.5

set terminal png small size 640, 480
set output 'charts/official-vs-low-invalid-vs-high-invalid-votes-2.png'

set xtic rotate
set yrange [0:0.3]

set title "Official results vs polling stations with low and high invalid votes"

set style fill solid
set boxwidth 0.2

plot "sql-queries/08-official-vs-low-invalid-vs-high-invalid-votes-transponded.csv" \
    using 2:xtic(1) \
    title "official" \
    with boxes, \
    "" using ($0 + 0.21):3 lt rgb "#20bc08"  \
    title "low invalid" \
    with boxes, \
    "" using ($0 + 0.42):4 lt rgb "#bc0e08"\
    title "high invalid" \
    with boxes