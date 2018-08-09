#!/bin/bash

echo "USAGE: [filename=<name.pdf>] [logscale=yes] [column=<INT>] [title=<String>] ./cactus.sh inp1, inp2, ... | gnuplot" >&2

# Remove (previous) temporary files
rm -f *.tmp

# Get the column with the plotted data, default is column 2
if [[ -z $column ]]
then
    column=2
fi

# Set the plot title if specified
if [[ -n $title ]]
then
		echo 'set title "'$title'"'
fi

# Set the key position and labels
echo 'set key bottom'
echo 'set xlabel "Problem"'
echo 'set ylabel "Improvement"'
if [[ -n $logscale ]]
then
    echo 'set logscale y'
fi

# Plot all the data
first=0
for var in "$@"
do
    cut -d " " -f $column $var > $var.tmp
    if [ $first -eq 0 ]
    then
			echo 'plot "'$var.tmp'" w l t "'$var'"'
			first=1
    else
			echo 'replot "'$var.tmp'" w l t "'$var'"'
    fi
done

# If no filename specified just show the plot
if [[ -z $filename ]]
then
    echo 'pause 1000'
else
    echo 'set term pdf'
    echo 'set output "'$filename'"'
    echo 'replot'
fi
