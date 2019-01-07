
<!-- README.md is generated from README.Rmd. Please edit that file -->

# spnethack

The goal of spnethack is to explore spatial networks in R.

# Requirements

We’ll use the following packages:

``` r
library(sf)
library(osmdata)
library(dodgr)
library(stplanr)
library(dplyr)
library(piggyback)
```

# Data

It makes sense to have some input data.

## From josm

Data from OSM was downloaded with the `josm` GUI. It can be read-in as
follows:

``` r
pb_download("promenade-all.geojson")
promenade_all = read_sf("promenade-all.geojson")
promenade_min = promenade_all %>% 
  filter(name == "Promenade")
# write_sf(promenade_min, "promenade-min.geojson")
```

The minimum dataset can be read-in as follows:

``` r
pb_download("promenade-min.geojson")
#> ✔ Setting active project to '/home/robin/repos/spnethack'
#> All files up-to-date already
promenade_min = read_sf("promenade-min.geojson")
plot(promenade_min$geometry)
```

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

## From osmdata (currently not working)

``` r
promenade = opq(bbox = "munster") %>% 
  add_osm_feature(key = "name", value = "Promenade")
```
