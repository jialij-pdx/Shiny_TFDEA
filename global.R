#******************************************************************************
#
# global.R
# Loads packages used in server.R and ui.R and contains global variables
#
#******************************************************************************
# Install missing packages
packages <- c("Rcpp", "dplyr", "shiny", "RCurl", "TFDEA", "WriteXLS", "car", "devtools", "ggvis")
if (length(setdiff(packages, installed.packages())) > 0)
  install.packages(setdiff(packages, installed.packages()))

# Install required packages not part of cran
if (!"shinyIncubator" %in% installed.packages())
  devtools::install_github("shiny-incubator", "rstudio")

library(shiny)              # Required for the Shiny application
library(shinyIncubator)     # Required for additional Shiny options
library(RCurl)              # Required for obtaining data from Google spreadsheets 
library(TFDEA)              # Required for TFDEA analysis
library(WriteXLS)           # Required for Writing results to an XLS spreadsheet
library(car)
library(ggvis)              # Required for plotting results

# source("R/renderJQPlot.R")  # Required to render Interactive Plots (in server.R)
# source("R/jqplotOutput.R")  # Required to render Interactive Plots (in ui.R)

options(shiny.maxRequestSize=10*1024^2) # set the maximum upload file size to 10MB.

# List of options for accessing and reading the data  (used in ui.R)
#file.source.opts <- list('Google Spreadsheet' = 'google', Local = 'local', Dropbox = 'dropbox')

# disable upload from google and dropbox function
file.source.opts <- list(Local = 'local')
file.sep.opts <- list(Comma = ',', Semicolon = ';', Tab = '\t')
# file.quote.opts <- list(None = 'none', 'Single Quote' = 'single', 'Double Quote' = 'double')
file.quote.opts <- list(None = '', 'Single Quote' = "'", 'Double Quote' = '"')
accepted.files <- c('.csv','text/csv', 'text/comma-separated-values','text/plain')

# Default URL for dropbox and google spreadsheet files when app loads. Links are currently for Fighter jet data
# (used in ui.R)
#dropbox.default <- 'https://dl.dropboxusercontent.com/u/114755843/Martino_data.csv'
#gs.default <- 'https://docs.google.com/a/pdx.edu/spreadsheet/ccc?key=0Ah3jpDcVSUVpdFlIdWNzV2NmVHJ5bFQxcXZ5MnBNNnc#gid=0'

# List of options for TFDEA analysis (used in ui.R)
orientation.opts <- list(Output = 'out', Input = 'in')
crs.opts <- list('Variable Returns to Scale' = 'vrs', 'Constant Returns to Scale' = 'crs', 
                 'Decreasing Returns to Scale' = 'drs', 'Increasing Returns to Scale' = 'irs')
frontier.type.opts <- list(Static = 'static', Dynamic = 'dynamic')
secondary.obj.opts <- list(Min = 'min', Max = 'max')

