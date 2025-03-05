# targets R package

Load up the pipeline. 

    source("_targets.R")
    
To visualize the targets pipeline and its current status, 
run the following function.
    
    tar_visnetwork()
    
To run the targets pipeline, run the following function. 
    
    tar_make()
    
Targets stores all intermediate objects in the _targets/ folder. 
These intermediate objects can be loaded. 
    
    tar_load(c(combined, all_graphic))