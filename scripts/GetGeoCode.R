#GetGeoCode <- function(){
    library('gmt')
    print(paste("Running GetGeoCode:", Sys.time()))
    totRow <- nrow(data)
    for( i in 1:nrow(data)){
        
        startStation <- data[i,4]
        endStation <- data[i,5]
        idx <- match(startStation, data.station$station)
        idx2 <- match(endStation, data.station$station)
        if(is.na(idx)){
            idx <- match(startStation, data.station$name)
        }       
        
        if(is.na(idx2)){
            idx2 <- match(endStation, data.station$name)
        }
        
        startStationLat <- data.station[idx,6]
        startStationLon <- data.station[idx,7]
        endStationLat <- data.station[idx2,6]
        endStationLon <- data.station[idx2,7]
        
        print(paste("GetGeoCode: Processing",i,"of",totRow
                    ,"start:",startStationLat, startStationLon
                    , "end:", endStationLat, endStationLon))
        
        data[i,9] <- startStationLat
        data[i,10] <- startStationLon
        data[i,11] <- endStationLat
        data[i,12] <- endStationLon
        data[i,13] <- geodist(startStationLat,startStationLon
                                   ,endStationLat, endStationLon ,units="km")
        rm(idx)
        rm(idx2)
    }
    rm(totRow)
    colnames(data)[9] <- "Orig.Lat"
    colnames(data)[10] <- "Orig.Long"
    colnames(data)[11] <- "Dest.Lat"
    colnames(data)[12] <- "Dest.Long"
    colnames(data)[13] <- "Euclid.Dist"
#}