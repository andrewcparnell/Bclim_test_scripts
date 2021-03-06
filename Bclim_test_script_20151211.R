# Some test scripts and data to run the Sluggan moss data on Bclim

# Install the package
devtools::install_github('Bclim')
#install.packages('Bclim')
library(Bclim)

# Load in the Sluggan data - pollen and chronologies
sluggan_pollen = read.table('data/Sluggan_pollen.txt',header=TRUE)
sluggan_chrons = read.table('data/Sluggan_chrons.txt',nrow=2000)

# Run the layer_clouds function
layers = layer_clouds(sluggan_pollen)

# Run the climate histories function
histories = climate_histories(layers,sluggan_chrons,seq(0,14,by=0.1))
save(histories,file='Sluggan_histories.rda')
#load(file='Sluggan_histories.rda')

# Function plot.layer_clouds
par(mar=c(3,3,2,1), mgp=c(2,.7,0), tck=-.01,las=1)
#plot(layers,dims=2:3,main='Layer 1',xlab='MTCO',ylab='AET/PET',col=terrain.colors(30))
plot(histories$layers,main='Layer 1',xlab='GDD5',ylab='MTCO',col=terrain.colors(30))
plot(histories$layers,layer=50, dims=2:3, main='Layer 50',xlab='MTCO',ylab='AET/PET',col=terrain.colors(30))

# Function plot.climate_histories
par(mar=c(3,3,2,1), mgp=c(2,.7,0), tck=-.01,las=1)
plot(histories,chron=sluggan_chrons,xlab='Age (k cal years BP)',ylab='GDD5',main='Sluggan Moss')
legend('topleft',legend=c('Layer clouds','Climate ribbon','Representative history'),pch=15,col=c('blue','red','green'))
plot(histories,dim=2,chron=sluggan_chrons,xlab='Age (k cal years BP)',ylab='GDD5',main='Sluggan Moss')
legend('bottomleft',legend=c('Layer clouds','Climate ribbon','Representative history'),pch=15,col=c('blue','red','green'))
plot(histories,dim=3,most_representative = 3, chron=sluggan_chrons,xlab='Age (k cal years BP)',ylab='AET/PET',main='Sluggan Moss')
legend('bottomleft',legend=c('Layer clouds','Climate ribbon','Representative histories'),pch=15,col=c('blue','red','green'))

# Function summary.climate_histories
summary(histories,dim=3)

