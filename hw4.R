# Ineqaulity task - week 4

### Read in data:

# Located within the Data folder:

# HDI data from: https://hdr.undp.org/data-center/documentation-and-downloads
# Shapefile from: https://hub.arcgis.com/datasets/2b93b06dc0dc4e809d3c8db5cb96ba69_0/explore?location=-2.688200%2C0.000000%2C1.41 

setwd("D:/Desktop/CASA0005/week4/Practical 4/hw4")
## Load packages
library(tidyverse)
library(sf)
library(here)
library(janitor)
library(countrycode)

## Read Data
HDI <- read_csv(here::here("HDR21-22_Composite_indices_complete_time_series.csv"),
                locale = locale(encoding = "latin1"),
                na = " ", skip=0)
World <- st_read("World_Countries_(Generalized)/World_Countries__Generalized_.shp")

## Select columns and convert country names into country codes
HDIcols <- HDI %>%
  clean_names() %>%
  select(iso3, country, gii_2019, gii_2010) %>%
  mutate(difference=gii_2019-gii_2010) %>%
  mutate(iso_code=countrycode(country, origin = 'country.name', destination = 'iso2c')) %>%
  mutate(iso_code2=countrycode(iso3, origin ='iso3c', destination = 'iso2c'))

## Join data
Join_HDI <- World %>% 
  clean_names() %>%
  left_join(., 
            HDIcols,
            by = c("iso" = "iso_code"))
view(Join_HDI)
