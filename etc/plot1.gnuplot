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
set style data histograms
set style histogram rowstacked
set style line 10 linetype 1 linecolor rgb "#41868F";
set style line 11 linetype 1 linecolor rgb "#8F4167";
set style line 12 linetype 1 linecolor rgb "#FF0000";
set style line 13 linetype 1 linecolor rgb "#00FF00";
set style line 14 linetype 1 linecolor rgb "#0000FF";
set style line 15 linetype 1 linecolor rgb "#EECC00";
set style line 16 linetype 1 linecolor rgb "#00EECC";
set style fill solid;
set datafile missing "?";
set output 'charts/'.filename."_by_department.svg";
plot \
  'gnuplot/'.filename.'.csv' \
           using 1:($2) with lines ls 1,  \
        '' using 1:($11) with steps ls 2, \
        '' using 1:($15) with steps ls 3, \
        '' using 1:($12) with steps ls 4, \
        '' using 1:($16) with steps ls 5, \
        '' using 1:($13) with steps ls 6, \
        '' using 1:($17) with steps ls 7, \
        '' using 1:($14) with steps ls 8, \
        '' using 1:($18) with steps ls 9;

set output 'charts/'.filename."_to_individual_step.svg";
plot \
  'gnuplot/'.filename.'.csv' \
           using 1:($2) with lines,  \
        '' using 1:($19) with steps,\
        '' using 1:($20) with steps,\
        '' using 1:($21) with steps,\
        '' using 1:($22) with steps, \
        '' using 1:($23) with steps, \
        '' using 1:($24) with steps, \
        '' using 1:($25) with steps, \
        '' using 1:($26) with steps, \
        '' using 1:($27) with steps, \
        '' using 1:($37) with steps;
       

set boxwidth 0.4;
set output 'charts/'.filename."_to_individual_barchart.svg";
set style data histogram
set style histogram rowstacked
set style fill solid border -1
plot \
  'gnuplot/'.filename.'.csv' \
           using 1:($2) with lines;
plot 'gnuplot/'.filename.'.csv' \
  using 1:xtic(1), for [i=19:23] '' using i;
plot 'gnuplot/'.filename.'.csv' \
  using 1:xtic(1), for [i=24:27] '' using i;
