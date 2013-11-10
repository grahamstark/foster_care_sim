
for f in `ls output/*.csv` 
do
        b=`basename $f .csv`
        echo "On $b"
        #
        # strip out summary lines at bottom...
        #
        head output/$b.csv > tmp/$b.csv -n 31
        #
        # clear out all non-numeric lines since Gnuplot doesn't like those
        #
        cut -d, -f1,2,3,4,5,6,7,9,10,11,12,16,17,18 --complement tmp/$b.csv > gnuplot/$b.csv
        #
        # plot the graphs
        #
        gnuplot -e "filename='$b'" etc/plot1.gnuplot
done
