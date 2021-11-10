## Source code for Intensity Slopes
## Rosalyn Carr for Kevin Ho (Dr. Guy Tanentzapf Lab); University of British Columbia
## January 2021

## Each individual sample was manually cleaned of outliers prior to linear regression
## Data (especially sigmoid) must be manually segmented so that only the area of interest
## 	included in the model, otherwise the rate of change will not be accurate. Accuracy
##	is fully dependent on the manually preparation.
## Data file should be openned in environment prior to running
## Slope will be printed as output "s"

#__________________________________________________________________________________________

y <- file_name_data$sample_number
x <- 1:length(y)

m <- lm(y ~ x)
s = unname(coef(m)["x"])
s