library(readr)
refine <- read_csv("C:/Users/User/Desktop/R Stuff/refine_original.csv")
output <- matrix(0, nrow=25, ncol=13)
  
  
for (i in 1:dim(refine)[1])
{
  companyName <- refine[[1]][i]
  if (!is.na(companyName))
  {
    #Clean Up Names
    if(grepl("phi",tolower(companyName)) || grepl("fil",tolower(companyName)) || grepl("phl",tolower(companyName)))
    {  
      output[i,1]<-"Phillips"
      output[i,6]<-1
    }
    
    else if(grepl("ak",tolower(companyName)))
    {  
      output[i,1]<-"AKZO"
      output[i,7]<-1
    }  
    
    else if(grepl("van",tolower(companyName)))
    {
      output[i,1]<-"Van Houten"
      output[i,8]<-1
    }  
      
    else if(grepl("uni",tolower(companyName)))
    {
      output[i,1]<-"Unilever"
      output[i,9]<-1
    }
    #Separate Product Code + Number
    
    tempVar <- strsplit(refine[[i,2]],"-")[[1]]
    
    #Meaningful variable names for readability
    productCode <- tempVar[[1]] 
    productNumber <- tempVar[[2]]
    productType <- ""
    
    output[i,2] <- productCode
    output[i,3] <- productNumber
    
    if (productCode=="p")
    { 
      productType <- "Smartphone"
      output[i,10]<-1
    }
    
    else if (productCode=="v")
    {
      productType <- "TV"
      output[i,11]<-1
    }
      
    
    else if (productCode=="x")
    {
      productType <- "Laptop"
      output[i,12]<-1
    }  
    
    else if (productCode=="q")
    {
      productType <- "Tablet"
      output[i,13]<-1
    }
    
    output[i,4] <- productType
    
    #Combine Addresses
    
    address <- refine[i,3]
    city <- refine[i,4]
    country <- refine[i,5]
    
    output[i,5] <- paste(address,city,country,sep=", ")
      
  }
}

#Format names on output matrix

colnames(output) <- c("Company Name","Product Code", "Product Number", "Product Type", "Address", "company_philips", "company_akzo", "company_van_houten", "company_unilever", "product_smartphone", "product_tv", "product_laptop", "product_tablet")


write.csv(output, file = "C:\\Users\\User\\Desktop\\R Stuff\\refine_clean.csv",row.names=FALSE)
