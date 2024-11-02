# Usage: gnuplot -persist -c "plot.gp" "output.png" "plot_title" "data_file.txt"

# Set the terminal to PNG and specify the output file
set terminal pngcairo size 800,600 enhanced font 'Verdana,10'
set output ARG1


# Set title and labels
set title ARG2
set xlabel "Category"
set ylabel "Count"

# Rotate x-axis labels for better readability
set xtics rotate by -45

# Set style for bars
set style data histograms
set style fill solid 1.0 border -1

# Set grid
set grid ytics

# Read data from file and plot
set datafile separator ","
plot ARG3 using 2:xtic(1) title 'Counts', \
     '' using 0:2:(sprintf('%.0f', $2)) with labels offset 0,1 notitle

