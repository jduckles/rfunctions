country_hillshade <- function( country )  {
  require(raster)
  country_elev <- getData('alt', country=country)
  country_slope <- terrain(country_elev[[1]], opt='slope', unit="radians" )
  country_aspect <- terrain(country_elev[[1]], opt='aspect', unit="radians")
  country_hs <- hillShade(country_slope, country_aspect, angle=45, direction=0)
  return(country_hs)
}
