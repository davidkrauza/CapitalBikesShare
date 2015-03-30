#GetGeoCode <- function(){
    library('gmt')
    print(paste("Running GetGeoCode:", Sys.time()))
    for( i in 1:nrow(data)){
        idx <- match(data[i,4], data.station$station)
        idx2 <- match(data[i,5], data.station$station)
        if(is.na(idx)){
            idx <- match(data[1,4], data.station$name)
        }       
        
        if(is.na(idx2)){
            idx2 <- match(data[1,5], data.station$name)
        }
        
        data[i,9] <- data.station[idx,6]
        data[i,10] <- data.station[idx,7]
        data[i,11] <- data.station[idx2,6]
        data[i,12] <- data.station[idx2,7]
        data[i,13] <- geodist(data.station[idx,6],data.station[idx,7]
                                   ,data.station[idx2,6], data.station[idx2,7]
                                   ,units="km")
    }
    colnames(data)[9] <- "Orig.Lat"
    colnames(data)[10] <- "Orig.Long"
    colnames(data)[11] <- "Dest.Lat"
    colnames(data)[12] <- "Dest.Long"
    colnames(data)[13] <- "Euclid.Dist"
#}