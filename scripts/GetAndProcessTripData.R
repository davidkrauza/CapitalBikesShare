#GetAndProcessTripData.R
##This file will check for the trip data sets. If the datasets do not exist
##in the current environment, the script will download and extract the files.
##This script will also process the data files to include data elements that
##is not being provided by the Capital Bike Shares program. This data include
##the geographic location of the bike stations and the Euclidian distance
##between the orgination and desitation bike station

startTime <-  Sys.time()
print(paste("Beginning process @:",startTime))
#source("GetElapsedDuration.R")
#source("GetGeoCode.R")

library(XML)
library(RCurl)


##Get station information
##Station data is current as of March-2015
##If stations for trips represented in older data have been removed 
##they may not be represented in this file
print("Processing Station Data")
if(!file.exists("../../CapitalBikeShareData/csv/CapitalBikeShare-Stations.csv")){  
    print("Downloading Station Data")
    xml.url <- 
        "https://www.capitalbikeshare.com/data/stations/bikeStations.xml"
    xml.doc <- xmlParse(getURL(xml.url))
    data.xml <- xmlToDataFrame(xml.doc)
    data.xml$station <- 
        paste(data.xml$name, " (", data.xml$terminalName, ")", sep="")
    print("Writing Station Data to File")
    write.csv(data.xml, "../../CapitalBikeShareData/csv/CapitalBikeShare-Stations.csv")    
}
data.station <- read.csv("../../CapitalBikeShareData/csv/CapitalBikeShare-Stations.csv")

print("Processing Q4 2010 Trip Data")
#2010 Q4 Data
if(!file.exists("../../CapitalBikeShareData/csv/2010-Q4-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2010-Q4-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2010-Q4-Trips-History-Data.zip")){
                download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2010-Q4-Trips-History-Data.zip"
                  ,"../../CapitalBikeShareData/zip/2010-Q4-Trips-History-Data.zip"
                  , method="curl", mode="wb")
        }
        ##if the zip file exists but not the CSV file, the data will be extracted
        unzip("../../CapitalBikeShareData/zip/2010-Q4-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    ##Read 2010 data into dataframe
    print("Reading Q4 2010 Trip Data")
    data <- read.csv("../../CapitalBikeShareData/csv/2010-Q4-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print("Writing Processed Q4 2010 Trip Data to file")
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2010-Q4-Trips-History-Duration-Distance.csv")
    rm(data)
}



#2011 Q1 Data
print("Processing Q1 2011 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2011-Q1-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2011-Q1-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2011-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q1-Trips-History-Data.zip"
                      ,"../../CapitalBikeShareData/zip/2011-Q1-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2011-Q1-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print("Reading Q1 2011 Trip Data")
    data <- read.csv("../../CapitalBikeShareData/csv/2011-Q1-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print("Writing Processed Q1 2011 Trip Data to file")
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2011-Q1-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2011 Q2 Data
print("Processing Q2 2011 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2011-Q2-Trips-History-Duration-Distance.csv")){   
    if(!file.exists("../../CapitalBikeShareData/csv/2011-Q2-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2011-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q2-Trips-History-Data.zip"
                      ,"../../CapitalBikeShareData/zip/2011-Q2-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2011-Q2-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q2 2011 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2011-Q2-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q2 2011 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2011-Q2-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2011 Q3 Data
print("Processing Q3 2011 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2011-Q3-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2011-Q3-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2011-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q3-Trips-History-Data.zip"
                      ,"../../CapitalBikeShareData/zip/2011-Q3-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2011-Q3-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q3 2011 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2011-Q3-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q3 2011 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2011-Q3-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2011 Q4 Data
print("Processing Q4 2011 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2011-Q4-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2011-Q4-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2011-Q4-Trips-History-Data.zip")){
        download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q4-Trips-History-Data.zip"
                      ,"../../CapitalBikeShareData/zip/2011-Q4-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2011-Q4-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q4 2011 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2011-Q4-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q4 2011 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2011-Q4-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2012 Q1 Data
print("Processing Q1 2012 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2012-Q1-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2012-Q1-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2012-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q1-Trips-History-Data.zip"
                          ,"../../CapitalBikeShareData/zip/2012-Q1-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2012-Q1-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q1 2012 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2012-Q1-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q1 2012 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2012-Q1-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2012 Q2 Data
print("Processing Q2 2012 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2012-Q2-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2012-Q2-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2012-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q2-Trips-History-Data.zip"
                          ,"../../CapitalBikeShareData/zip/2012-Q2-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2012-Q2-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q2 2012 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2012-Q2-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q2 2012 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2012-Q2-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2012 Q3 Data
print("Processing Q3 2012 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2012-Q3-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2012-Q3-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2012-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q3-Trips-History-Data.zip"
                          ,"../../CapitalBikeShareData/zip/2012-Q3-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2012-Q3-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData//csv")
    }
    print(paste("Reading Q3 2012 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2012-Q3-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q3 2012 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2012-Q3-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2012 Q4 Data
print("Processing Q4 2012 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2012-Q4-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2012-Q4-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2012-Q4-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q4-Trips-History-Data.zip"
                          ,"../../CapitalBikeShareData/zip/2012-Q4-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2012-Q4-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q4 2012 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2012-Q4-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q4 2012 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2012-Q4-Trips-History-Duration-Distance.csv")
    rm(data)
}
    
#2013 Q1 Data
print("Processing Q1 2013 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2013-Q1-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2013-Q1-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2013-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-Q1-Trips-History-Data.zip"
                          ,"../../CapitalBikeShareData/zip/2013-Q1-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2013-Q1-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q1 2013 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2013-Q1-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q1 2013 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2013-Q1-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2013 Q2 Data
print("Processing Q2 2013 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2013-Q2-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2013-Q2-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2013-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-Q2-Trips-History-Data.zip"
                          ,"../../CapitalBikeShareData/zip/2013-Q2-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2013-Q2-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q2 2012 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2013-Q2-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q2 2013 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2013-Q2-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2013 Q3 Data
print("Processing Q3 2013 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2013-Q3-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2013-Q3-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2013-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-Q3-Trips-History-Data.zip"
                          ,"../../CapitalBikeShareData/zip/2013-Q3-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2013-Q3-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q3 2013 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2013-Q3-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q3 2013 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2013-Q3-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2013 Q4 Data
print("Processing Q4 2013 Trip Data")
if(!.file.exists("../../CapitalBikeShareData/csv/2013-Q4-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2013-Q4-Trips-History-Data2.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2013-Q4-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-4th-quarter.zip"
                          ,"../../CapitalBikeShareData/zip/2013-Q4-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2013-Q4-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q4 2013 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2013-Q4-Trips-History-Data2.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q4 2013 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2013-Q4-Trips-History-Duration-Distance.csv")
    rm(data)
}
    
#2014 Q1 Data
print("Processing Q1 2014 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2014-Q1-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2014-Q1-Trips-History-Data2.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2014-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-1st-quarter.zip"
                          ,"../../CapitalBikeShareData/zip/2014-Q1-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2014-Q1-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q1 2014 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2014-Q1-Trips-History-Data2.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q1 2014 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2014-Q1-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2014 Q2 Data
print("Processing Q2 2014 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2014-Q2-Trips-History-Duration-Distance.csv")){    
    if(!file.exists("../../CapitalBikeShareData/csv/2014-Q2-Trips-History-Data2.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2014-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-2nd-quarter.zip"
                          ,"../../CapitalBikeShareData/zip/2014-Q2-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2014-Q2-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q2 2014 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2014-Q2-Trips-History-Data2.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q2 2014 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2014-Q2-Trips-History-Duration-Distance.csv")
    rm(data)   
}

#2014 Q3 Data
print("Processing Q3 2014 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2014-Q3-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2014-Q3-Trips-History-Data3.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2014-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-3rd-quarter.zip"
                          ,"../../CapitalBikeShareData/zip/2014-Q3-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2014-Q3-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q3 2014 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2014-Q3-Trips-History-Data3.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q3 2014 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2014-Q3-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2014 Q4 Data
print("Processing Q4 2014 Trip Data")
if(!file.exists("../../CapitalBikeShareData/csv/2014-Q4-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../../CapitalBikeShareData/csv/2014-Q4-Trips-History-Data.csv")){
        if(!file.exists("../../CapitalBikeShareData/zip/2014-Q4-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-4th-quarter.zip"
                          ,"../../CapitalBikeShareData/zip/2014-Q4-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../../CapitalBikeShareData/zip/2014-Q4-Trips-History-Data.zip"
              , exdir="../../CapitalBikeShareData/csv")
    }
    print(paste("Reading Q4 2014 Data",Sys.time()))
    data <- read.csv("../../CapitalBikeShareData/csv/2014-Q4-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q4 2014 Data to Disk",Sys.time()))
    write.csv(data
              , file="../../CapitalBikeShareData/csv/2014-Q4-Trips-History-Duration-Distance.csv")
    rm(data)
}
    
endTime <- Sys.time()
print(paste("Ending process @:",endTime))  