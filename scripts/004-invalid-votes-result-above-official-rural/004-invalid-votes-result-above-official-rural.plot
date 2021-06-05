set key noautotitle
set datafile separator comma
set pointsize 0.5

set terminal png small size 640, 480
set output 'charts/invalid-votes-result-above-official-rural.png'

set xtic rotate
set yrange [0:]

set title "Percentage of invalid votes when result above official - rural areas"

set style fill solid
set boxwidth 0.4

plot "sql-queries/09-invalid-votes-result-above-official-rural-sorted.csv" \
    using 2:xtic(1) \
    with boxes