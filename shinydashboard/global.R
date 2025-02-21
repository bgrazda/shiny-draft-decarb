# Load packages
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(shinycssloaders)


# read in data ---
lake_data <- read_csv('data/lake_data_processed.csv')

counties <- readxl::read_xlsx('data/ccc-coords.xlsx')


