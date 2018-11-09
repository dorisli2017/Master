set terminal epslatex color
set output 'pm3d17.tex'
set border 4095 front linetype -1 linewidth 1.000
set style line 100  linetype 5 linewidth 0.500 pointtype 100 pointsize default
set view 50, 220, 1, 1
set samples 30, 30
set isosamples 30, 30
unset surface
set title "set pm3d hidden3d <linetype>: pm3d's much faster hidden3d variant" 
set xrange [ -2.00000 : 2.00000 ] noreverse nowriteback
set yrange [ -2.00000 : 2.00000 ] noreverse nowriteback
set pm3d implicit at s
set pm3d interpolate 1,1 flush begin noftriangles hidden3d 100 corners2color mean
splot log(x*x*y*y)
