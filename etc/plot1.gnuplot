# set term postscript eps enhanced color font 'Arial,10';
# set term png size 1000,800 ;
# set term png font 'Arial,10';
# set term pngcairo size 800,600 font 'Arial,10' dashed ;
set term svg size 1000,800 font 'Arial,10' dashed ;

set datafile separator ",";

set xlabel "Age"
set ylabel "GBPs P.A"

set key autotitle columnhead;

#
# light grey grid in background
#
set style line 99 lc rgb '#AAAAAA' lt 3 lw 1
set grid back ls 99

#
# some line styles
#
set style line 1 linetype 1 linecolor rgb "#333333";
# children's services
set style line 2 linetype 1 linecolor rgb "#BE863D";
set style line 3 linetype 2 linecolor rgb "#BE863D" linewidth 2;
# LA
set style line 4 linetype 1 linecolor rgb "#953FAC";
set style line 5 linetype 3 linecolor rgb "#953FAC" linewidth 2;
# Welsh govt
set style line 6 linetype 1 linecolor rgb "#9D1E10";
set style line 7 linetype 3 linecolor rgb "#9D1E10" linewidth 2;
# UK Govt
set style line 8 linetype 1 linecolor rgb "#1E1E68";
set style line 9 linetype 3 linecolor rgb "#1E1E68" linewidth 2;

set style line 10 linetype 1 linecolor rgb "#41868F";
set style line 11 linetype 1 linecolor rgb "#8F4167";
set style line 12 linetype 1 linecolor rgb "#8F8D41";
set style line 13 linetype 1 linecolor rgb "#AC3FA3";


set output 'charts/'.filename."_by_department.svg";
plot \
  'output/'.filename.'.csv' \
           using 1:2 with lines ls 1,  \
        '' using 1:11 with lines ls 2, \
        '' using 1:15 with lines ls 3, \
        '' using 1:12 with lines ls 4, \
        '' using 1:16 with lines ls 5, \
        '' using 1:13 with lines ls 6, \
        '' using 1:17 with lines ls 7, \
        '' using 1:14 with lines ls 8, \
        '' using 1:18 with lines ls 9;

        
set output 'charts/'.filename."_to_individual.svg";
plot \
  'gnuplot/'.filename.'.csv' \
           using 1:2 with lines ls 1,  \
        '' using 1:19 with lines ls 4, \
        '' using 1:20 with lines ls 6, \
        '' using 1:21 with lines ls 8, \
        '' using 1:22 with lines ls 10, \
        '' using 1:23 with lines ls 11, \
        '' using 1:24 with lines ls 12, \
        '' using 1:25 with lines ls 2, \
        '' using 1:35 with lines ls 13;
        
