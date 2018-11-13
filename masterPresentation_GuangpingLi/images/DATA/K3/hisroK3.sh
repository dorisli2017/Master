#!/usr/bin/gnuplot -persist
clear
reset
set terminal pdf
unset key
# Make the x axis labels easier to read.
set title "K3-Number of flips"
set key invert reverse Left outside
set key autotitle columnheader
set xtics rotate out
set grid y
set output "K3"
# Select histogram data
set style data histogram
# Give the bars a plain fill pattern, and draw a solid line around them.
set style fill solid border
set style histogram rowstacked
set boxwidth 0.6 relative
plot for [COL=2:3] 'k3.tsv' using COL:xticlabels(1) title columnheader
