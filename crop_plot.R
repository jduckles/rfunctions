crop_plot <- function(raster_file, borders_file) {
  raster <- raster(readGDAL(raster_file))
  borders <- readOGR(borders_file)
  colors <- rev(brewer.pal(n=10, name = "RdBu"))
  data <- crop(raster, extent(borders) )
  plot(data, col=colors)
  plot(borders, add=TRUE)
}
