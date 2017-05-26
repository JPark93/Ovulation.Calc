# Grants you access to my code; you don't need to open this.
  source("https://raw.githubusercontent.com/JPark93/OvulationCalculator/master/OvulationCalculator.R")
# Read in your dataset
  # Data should be formatted as:
    # Column 1 - Survey Date (SD)
    # Column 2 - Period Before Last (PBL)
    # Column 3 - Last Period (LP)
    # Column 4 - Next Period (NP)
  # date.format should be:
    # "USA" - for MM/DD/YYYY organized data
    # "WORLD" - for DD/MM/YYYY organized data
# Read in a dataset
  dataset = read.csv("https://raw.githubusercontent.com/JPark93/OvulationCalculator/master/Example.csv", header=FALSE)
# Select date format
  date.format = "USA"
# Run function
  Ovulation(dataset, "USA")
