# Some test scripts and data to run the Sluggan moss data on Bclim

# Install the package
devtools::install_github('Bclim')
#install.packages('Bclim')
library(Bclim)

# Source in new functions if required
source('../Bclim/R/layer_clouds.R')
dyn.load(system.file('libs/Bclim.so',package='Bclim'))

# Load in the Sluggan data - pollen and chronologies
sluggan_pollen = read.table('data/Sluggan_pollen.txt',header=TRUE)
sluggan_chrons = read.table('data/Sluggan_chrons.txt',header=TRUE)

# Run the layer_clouds function
layer_clouds(sluggan_pollen,path_to_rs = 'http://mathsci.ucd.ie/~parnell_a/')
