
file1 = "./o-any-edns-amplification_analysis.txt"
legend1 = "ANY EDNS"
file2 = "./o-any-noedns-amplification_analysis.txt"
legend2 = "ANY NoEDNS"
file3 = "./o-txt-edns-amplification_analysis.txt"
legend3 = "TXT EDNS"
file4 = "./o-txt-noedns-amplification_analysis.txt"
legend4 = "TXT NoEDNS"


# Set the terminal to PNG and specify the output file
set terminal pngcairo size 800,600 enhanced font 'Verdana,10'
set output "amplification_analysis_combined.png"

# Set title and labels
set title "Upgrade and Amplification Analysis"
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
set style line 4 lc rgb '#E0F7FA'  # Very Light Cyan

# Set y ticks an range
set autoscale yfixmax
set ytics 0,1000,30000
set yrange[0:]
set grid x,y

set key outside
set key center bottom

# Read the y-value from the first line of each file
get_skipped_value(file) = system(sprintf("awk -F, 'NR==1 {print $2}' %s", file))

# Plot data with labels
plot file1 using 2:xtic(1) skip 1 title sprintf('%s (Total: %s)', legend1, get_skipped_value(file1)) ls 1, \
     file2 using 2 skip 1 title sprintf('%s (Total: %s)', legend2, get_skipped_value(file2)) ls 2, \
     file3 using 2 skip 1 title sprintf('%s (Total: %s)', legend3, get_skipped_value(file3)) ls 3, \
     file4 using 2 skip 1 title sprintf('%s (Total: %s)', legend4, get_skipped_value(file4)) ls 4, \


