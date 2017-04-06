setwd("C:\Users\User\Desktop\R Stuff")
library(readr)

refine <- read_csv("C:/Users/User/Desktop/R Stuff/refine.csv")

for (i in 1:dim(refine))
{
  if (refine[[1]][i]!="NA")
  {
      tempvar <- refine[[1]][i]
      
  }
}
  