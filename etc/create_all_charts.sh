for f in `ls output/*.csv` do
        b = basename( $f )
        #
        # clear out all non-numeric lines since Gnuplot doesn't like those
        #
        cut -d, -f1,2,3,4,5,6,7,9,10,11,12,16,17,18 --complement output/$b.csv > gnuplot/$b.csv
        #
        # strip out summary lines at bottom...
        #
        vim -s gnuplot/$b.csv etc/delete_to_end.vim
        #
        # plot the graphs
        #
        gnuplot -e "filename='$b'" etc/plot1.gnuplot
done
