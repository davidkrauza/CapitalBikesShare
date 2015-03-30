#GetAndProcessTripData.R
##This file will check for the trip data sets. If the datasets do not exist
##in the current environment, the script will download and extract the files.
##This script will also process the data files to include data elements that
##is not being provided by the Capital Bike Shares program. This data include
##the geographic location of the bike stations and the Euclidian distance
##between the orgination and desitation bike station

startTime <- Sys.time()
print(paste("Beginning process @:",startTime))
#source("GetElapsedDuration.R")
#source("GetGeoCode.R")

library(XML)
library(RCurl)

##Set up file directories to download data
if(!file.exists("../data/zip")){
    dir.create("../data/zip")
}
if(!file.exists("../data/csv")){
    dir.create("../data/csv")
}

##Get station information
##Station data is current as of March-2015
##If stations for trips represented in older data have been removed 
##they may not be represented in this file
print("Checking for Station Data")
if(!file.exists("../data/csv/CapitalBikeShare-Stations.csv")){  
    print("Downloading Station Data")
    xml.url <- 
        "https://www.capitalbikeshare.com/data/stations/bikeStations.xml"
    xml.doc <- xmlParse(getURL(xml.url))
    data.xml <- xmlToDataFrame(xml.doc)
    data.xml$station <- 
        paste(data.xml$name, " (", data.xml$terminalName, ")", sep="")
    print("Writing Station Data to File")
    write.csv(data.xml, "../data/csv/CapitalBikeShare-Stations.csv")    
}
print("Getting Station Data")
data.station <- read.csv("../data/csv/CapitalBikeShare-Stations.csv")

print("Checking for Q4 2010 Trip Data")
#2010 Q4 Data
if(!file.exists("../data/csv/2010-Q4-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2010-Q4-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2010-Q4-Trips-History-Data.zip")){
                download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2010-Q4-Trips-History-Data.zip"
                  ,"../data/zip/2010-Q4-Trips-History-Data.zip"
                  , method="curl", mode="wb")
        }
        ##if the zip file exists but not the CSV file, the data will be extracted
        unzip("../data/zip/2010-Q4-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    ##Read 2010 data into dataframe
    print("Reading Q4 2010 Trip Data")
    data <- read.csv("../data/csv/2010-Q4-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print("Writing Processed Q4 2010 Trip Data to file")
    write.csv(data
              , file="../data/csv/2010-Q4-Trips-History-Duration-Distance.csv")
    rm(data)
}



#2011 Q1 Data
print("Checking for Q1 2011 Trip Data")
if(!file.exists("../data/csv/2011-Q1-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2011-Q1-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2011-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q1-Trips-History-Data.zip"
                      ,"../data/zip/2011-Q1-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../data/zip/2011-Q1-Trips-History-Data.zip", exdir="../data/csv")
    }
    print("Reading Q1 2011 Trip Data")
    data <- read.csv("../data/csv/2011-Q1-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print("Writing Processed Q1 2011 Trip Data to file")
    write.csv(data
              , file="../data/csv/2011-Q1-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2011 Q2 Data
if(!file.exists("../data/csv/2011-Q2-Trips-History-Duration-Distance.csv")){   
    if(!file.exists("../data/csv/2011-Q2-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2011-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q2-Trips-History-Data.zip"
                      ,"../data/zip/2011-Q2-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../data/zip/2011-Q2-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q2 2011 Data",Sys.time()))
    data <- read.csv("../data/csv/2011-Q2-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q2 2011 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2011-Q2-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2011 Q3 Data
if(!file.exists("../data/csv/2011-Q3-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2011-Q3-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2011-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q3-Trips-History-Data.zip"
                      ,"../data/zip/2011-Q3-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../data/zip/2011-Q3-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q3 2011 Data",Sys.time()))
    data <- read.csv("../data/csv/2011-Q3-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q3 2011 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2011-Q3-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2011 Q4 Data
if(!file.exists("../data/csv/2011-Q4-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2011-Q4-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2011-Q4-Trips-History-Data.zip")){
        download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q4-Trips-History-Data.zip"
                      ,"../data/zip/2011-Q4-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../data/zip/2011-Q4-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q4 2011 Data",Sys.time()))
    data <- read.csv("../data/csv/2011-Q4-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q4 2011 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2011-Q4-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2012 Q1 Data
if(!file.exists("../data/csv/2012-Q1-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2012-Q1-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2012-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q1-Trips-History-Data.zip"
                          ,"../data/zip/2012-Q1-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2012-Q1-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q1 2012 Data",Sys.time()))
    data <- read.csv("../data/csv/2012-Q1-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q1 2012 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2012-Q1-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2012 Q2 Data
if(!file.exists("../data/csv/2012-Q2-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2012-Q2-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2012-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q2-Trips-History-Data.zip"
                          ,"../data/zip/2012-Q2-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2012-Q2-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q2 2012 Data",Sys.time()))
    data <- read.csv("../data/csv/2012-Q2-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q2 2012 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2012-Q2-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2012 Q3 Data
if(!file.exists("../data/csv/2012-Q3-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2012-Q3-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2012-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q3-Trips-History-Data.zip"
                          ,"../data/zip/2012-Q3-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2012-Q3-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q3 2012 Data",Sys.time()))
    data <- read.csv("../data/csv/2012-Q3-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q3 2012 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2012-Q3-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2012 Q4 Data
if(!file.exists("../data/csv/2012-Q4-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2012-Q4-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2012-Q4-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q4-Trips-History-Data.zip"
                          ,"../data/zip/2012-Q4-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2012-Q4-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q4 2012 Data",Sys.time()))
    data <- read.csv("../data/csv/2012-Q4-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q4 2012 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2012-Q4-Trips-History-Duration-Distance.csv")
    rm(data)
}
    
#2013 Q1 Data
if(!file.exists("../data/csv/2013-Q1-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2013-Q1-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2013-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-Q1-Trips-History-Data.zip"
                          ,"../data/zip/2013-Q1-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2013-Q1-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q1 2013 Data",Sys.time()))
    data <- read.csv("../data/csv/2013-Q1-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q1 2013 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2013-Q1-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2013 Q2 Data
if(!file.exists("../data/csv/2013-Q1-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2013-Q2-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2013-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-Q2-Trips-History-Data.zip"
                          ,"../data/zip/2013-Q2-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2013-Q2-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q2 2012 Data",Sys.time()))
    data <- read.csv("../data/csv/2013-Q2-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q2 2013 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2013-Q2-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2013 Q3 Data
if(!file.exists("../data/csv/2013-Q3-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2013-Q3-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2013-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-Q3-Trips-History-Data.zip"
                          ,"../data/zip/2013-Q3-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2013-Q3-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q3 2013 Data",Sys.time()))
    data <- read.csv("../data/csv/2013-Q3-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q3 2013 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2013-Q3-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2013 Q4 Data
if(!.file.exists("../data/csv/2013-Q4-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2013-Q4-Trips-History-Data2.csv")){
        if(!file.exists("../data/zip/2013-Q4-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-4th-quarter.zip"
                          ,"../data/zip/2013-Q4-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2013-Q4-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q4 2013 Data",Sys.time()))
    data <- read.csv("../data/csv/2013-Q4-Trips-History-Data2.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q4 2013 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2013-Q4-Trips-History-Duration-Distance.csv")
    rm(data)
}
    
#2014 Q1 Data
if(!file.exists("../data/csv/2014-Q1-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2014-Q1-Trips-History-Data2.csv")){
        if(!file.exists("../data/zip/2014-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-1st-quarter.zip"
                          ,"../data/zip/2014-Q1-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2014-Q1-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q1 2014 Data",Sys.time()))
    data <- read.csv("../data/csv/2014-Q1-Trips-History-Data2.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q1 2014 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2014-Q1-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2014 Q2 Data
if(!file.exists("../data/csv/2014-Q2-Trips-History-Duration-Distance.csv")){    
    if(!file.exists("../data/csv/2014-Q2-Trips-History-Data2.csv")){
        if(!file.exists("../data/zip/2014-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-2nd-quarter.zip"
                          ,"../data/zip/2014-Q2-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2014-Q2-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q2 2014 Data",Sys.time()))
    data <- read.csv("../data/csv/2014-Q2-Trips-History-Data2.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q2 2014 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2014-Q2-Trips-History-Duration-Distance.csv")
    rm(data)   
}

#2014 Q3 Data
if(!file.exists("../data/csv/2014-Q3-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2014-Q3-Trips-History-Data3.csv")){
        if(!file.exists("../data/zip/2014-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-3rd-quarter.zip"
                          ,"../data/zip/2014-Q3-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2014-Q3-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q3 2014 Data",Sys.time()))
    data <- read.csv("../data/csv/2014-Q3-Trips-History-Data3.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q3 2014 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2014-Q3-Trips-History-Duration-Distance.csv")
    rm(data)
}

#2014 Q4 Data
if(!file.exists("../data/csv/2014-Q4-Trips-History-Duration-Distance.csv")){
    if(!file.exists("../data/csv/2014-Q4-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2014-Q4-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-4th-quarter.zip"
                          ,"../data/zip/2014-Q4-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2014-Q4-Trips-History-Data.zip"
              , exdir="../data/csv")
    }
    print(paste("Reading Q4 2014 Data",Sys.time()))
    data <- read.csv("../data/csv/2014-Q4-Trips-History-Data.csv")
    ##Call Script to get elapsed duration
    source("GetElapsedDuration.R")
    ##Call Script to get Geo Code data and Euclidean Distance
    source("GetGeoCode.R")
    ##Write processed file to data directory and remove it for memory management
    print(paste("Writing Q4 2014 Data to Disk",Sys.time()))
    write.csv(data
              , file="../data/csv/2014-Q4-Trips-History-Duration-Distance.csv")
    rm(data)
}
    
endTime <- Sys.time()
print(paste("Ending process @:",endTime))  