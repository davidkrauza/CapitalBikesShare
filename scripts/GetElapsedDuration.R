#GetElapsedDuration <- function(){
    library(lubridate)
    print(paste("Running GetElapsedDuration:", Sys.time()))
    duration <- list() 
    matches <- regmatches(data$Duration
                          , gregexpr("[[:digit:]]+", data$Duration))
        
    for(i in 1:length(matches)){
        unlist.matches <- as.numeric(unlist(matches[[i]]))
        ###Debugging code########################################
        ###outp <- paste("i:",i," duration:"
        ###              ,new_duration(hour=unlist.matches[1]
        ###                            , minute=unlist.matches[2]
        ###                            , second=unlist.matches[3]))
        ###print(outp)
        #########################################################
        duration[i] <- new_duration(hour=unlist.matches[1]
                                    , minute=unlist.matches[2]
                                    , second=unlist.matches[3])
    }
    #print(as.numeric(as.matrix(duration)))
    duration.matrix <- as.matrix(duration)
    data$Elapsed.Duration <- as.numeric(duration.matrix)
#}
