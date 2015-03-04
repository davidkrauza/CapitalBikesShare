GetTripHistory <- function(){
    #2010 Data
    if(!file.exists("../data/csv/2010-Q4-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2010-Q4-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2010-Q4-Trips-History-Data.zip"
                      ,"../data/zip/2010-Q4-Trips-History-Data.zip", method="curl")
        }
        unzip("../data/zip/2010-Q4-Trips-History.zip", exdir="../data/csv")
    }
    
    #2011 Data
    if(!file.exists("../data/csv/2011-Q1-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2011-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q1-Trips-History-Data.zip"
                      ,"../data/zip/2011-Q1-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../data/zip/2011-Q1-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2011-Q2-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2011-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q2-Trips-History-Data.zip"
                      ,"../data/zip/2011-Q2-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../data/zip/2011-Q2-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2011-Q3-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2011-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q3-Trips-History-Data.zip"
                      ,"../data/zip/2011-Q3-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../data/zip/2011-Q3-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2011-Q4-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2011-Q4-Trips-History-Data.zip")){
        download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2011-Q4-Trips-History-Data.zip"
                      ,"../data/zip/2011-Q4-Trips-History-Data.zip"
                      , method="curl")
        }
        unzip("../data/zip/2011-Q4-Trips-History.zip", exdir="../data/csv")
    }
    
    #2012 Data
    if(!file.exists("../data/csv/2012-Q1-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2012-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q1-Trips-History-Data.zip"
                          ,"../data/zip/2012-Q1-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2012-Q1-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2012-Q2-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2012-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q2-Trips-History-Data.zip"
                          ,"../data/zip/2012-Q2-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2012-Q2-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2012-Q3-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2011-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q3-Trips-History-Data.zip"
                          ,"../data/zip/2012-Q3-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2012-Q3-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2012-Q4-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2012-Q4-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2012-Q4-Trips-History-Data.zip"
                          ,"../data/zip/2012-Q4-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2012-Q4-Trips-History.zip", exdir="../data/csv")
    }
    
    #2013 Data
    if(!file.exists("../data/csv/2013-Q1-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2013-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-Q1-Trips-History-Data.zip"
                          ,"../data/zip/2013-Q1-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2013-Q1-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2013-Q2-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2013-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-Q2-Trips-History-Data.zip"
                          ,"../data/zip/2013-Q2-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2013-Q2-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2013-Q3-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2013-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-Q3-Trips-History-Data.zip"
                          ,"../data/zip/2013-Q3-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2013-Q3-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2013-Q4-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2013-Q4-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2013-Q4-Trips-History-Data.zip"
                          ,"../data/zip/2013-Q4-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2013-Q4-Trips-History.zip", exdir="../data/csv")
    }
    
    #2014 Data
    if(!file.exists("../data/csv/2014-Q1-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2014-Q1-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-Q1-Trips-History-Data.zip"
                          ,"../data/zip/2014-Q1-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2014-Q1-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2014-Q2-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2014-Q2-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-Q2-Trips-History-Data.zip"
                          ,"../data/zip/2014-Q2-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2014-Q2-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2014-Q3-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2014-Q3-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-Q3-Trips-History-Data.zip"
                          ,"../data/zip/2014-Q3-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2014-Q3-Trips-History.zip", exdir="../data/csv")
    }
    
    if(!file.exists("../data/csv/2014-Q4-Trips-History-Data.csv")){
        if(!file.exists("../data/zip/2014-Q4-Trips-History-Data.zip")){
            download.file("https://www.capitalbikeshare.com/assets/files/trip-history-data/2014-Q4-Trips-History-Data.zip"
                          ,"../data/zip/2014-Q4-Trips-History-Data.zip"
                          , method="curl")
        }
        unzip("../data/zip/2014-Q4-Trips-History.zip", exdir="../data/csv")
    }
}