Ovulation = function(dataset, date.format = "USA"){

  if(date.format == "USA"){date.format = "%m/%d/%y"}else
    if(date.format == "WORLD"){date.format = "%d/%m/%y"}
# Objects -----------------------------------------------------------------
  dates = matrix(NA, nrow(dataset), ncol(dataset))
  day.dif = matrix(NA, nrow(dataset), 1)
  RCD = matrix(NA, nrow(dataset), 1)
  FCD = matrix(NA, nrow(dataset), 1)
  RCD.risk = matrix(NA, nrow(dataset), 1)
  FCD.risk = matrix(NA, nrow(dataset), 1)
  risk = c(0, 0, 0.001, 0.002, 0.004, 0.009,
           0.018, 0.032, 0.05, 0.069, 0.085,
           0.094, 0.093, 0.085, 0.073, 0.059,
           0.047, 0.036, 0.028, 0.021, 0.016,
           0.013, 0.01, 0.008, 0.007, 0.006,
           0.005, 0.005, 0.005, 0.006, 0.006,
           0.007, 0.007, 0.008, 0.009, 0.01,
           0.01, 0.011, 0.012, 0.013)

# Reformat dates based on provided information (i.e., is it USA or WORLD based) --------
  for(i in 1:ncol(dataset)){
    for(j in 1:nrow(dataset)){
      dates[j,i] = as.Date(dataset[j,i], date.format)
    }
  }
# Date Matrix -------------------------------------------------------------
  Date.Matrix = as.matrix(as.Date(dates, origin = "1970-01-01"), nrow(dataset), ncol(dataset))
# Difference between Last Period (LP) and Period Before Last (PBL) -------------------
  LP.PBL = Date.Matrix[,3] - Date.Matrix[,2]
# Difference between Next Period (NP) and Last Period (LP) -------------------
  NP.LP = Date.Matrix[,4] - Date.Matrix[,3]

# Calculating Reverse Cycle Day (RCD) and Forward Cycle Day (FCD) ---------------------
  for(i in 1:nrow(dataset)){
    day.dif[i,] = sum(LP.PBL[i],NP.LP[i])/2
      RCD[i,] = day.dif[i,] - (Date.Matrix[i,4] - Date.Matrix[i,1])
        if(RCD[i,] < 12.5){RCD[i,] = floor(RCD[i,])}else{if(RCD[i,] >= 12.5){RCD[i,] = round(RCD[i,])}}
      FCD[i,] = Date.Matrix[i,1] - Date.Matrix[i,3]
        if(FCD[i,] < 12.5){FCD[i,] = floor(FCD[i,])}else{if(FCD[i,] >= 12.5){FCD[i,] = round(FCD[i,])}}
  }
# Provide Risk of Ovulation -----------------------------------------------
  RCD.risk = risk[RCD]
  FCD.risk = risk[FCD]
    Ovulation.Risk = cbind(RCD.risk, FCD.risk)
      print(Ovulation.Risk)
}
