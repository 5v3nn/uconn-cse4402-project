# Usage: gnuplot -persist -c "plot.gp" "output.png" "plot_title" "file1" "legend" "file2" "legend" "file3" "legend"

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
set style histogram clustered gap 1
set style fill solid 1.0 border -1
set boxwidth 0.8 relative

# Set grid
set grid ytics

# Read data from files
set datafile separator ","

# Define a color palette from light to dark blue
set style line 1 lc rgb '#00BCD4'  # Dark Cyan
set style line 2 lc rgb '#4DD0E1'  # Medium Cyan
set style line 3 lc rgb '#B2EBF2'  # Light Cyan

# Set y ticks an range
set autoscale yfixmax
set ytics 0,1000,30000
set yrange[0:]
set grid x,y

file1 = ARG3
legend1 = ARG4
file2 = ARG5
legend2 = ARG6
file3 = ARG7
legend3 = ARG8

# Read the y-value from the first line of each file
get_skipped_value(file) = system(sprintf("awk -F, 'NR==1 {print $2}' %s", file))
skipped_value_A = get_skipped_value(file1)
skipped_value_TXT = get_skipped_value(file2)
skipped_value_ANY = get_skipped_value(file3)

# Plot data with labels
plot file1 using 2:xtic(1) skip 1 title sprintf('%s (Total: %s)', legend1, skipped_value_A) ls 1, \
     file2 using 2 skip 1 title sprintf('%s (Total: %s)', legend2, skipped_value_TXT) ls 2, \
     file3 using 2 skip 1 title sprintf('%s (Total: %s)', legend3, skipped_value_ANY) ls 3, \

