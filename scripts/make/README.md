# GNU Make Example

## Files

Data for different diamond `cut`s

- Fair.csv
- Good.csv
- Ideal.csv
- Premium.csv
- Very Good.csv

Scripts

- combine_data.R        reads and combines the individual diamond data sets
- create_graphic.R      function to create graphics
- create_all_graphic.R  function to create the all.png graphic
- create_I1_graphic.R   function to create the clarityI1.png graphic

## Makefile

The `Makefile` describes 

- target       what needs to be made 
- dependencies what the `target` depends on
- commands     what command needs to be run to create the target

The Makefile contains rules with the following format

  target: dependencies ...
    commands
    ...
  
Please note that the commands must be preceded by a tab. 


## Commands

To run the makefile use 

  make
  
This will grab the first rule and, if the dependencies have been modified, 
run the associated command(s).

You can run specific targets

  make all.png
  
You can test what will be run before you run it

  make -n 
  make -n all.png
  

## Pipeline

GNU Make and similar programs are great pipeline tools as they allow you to 
update files, scripts, etc upstream and run only the necessary downstream code
to recreate the end products. 

## Language-specific alternatives

### R 

[targets](https://books.ropensci.org/targets/) provides make functionality
within the R ecosystem. An appealing aspect of using `targets` instead of 
`GNU make` is that `targets` is built on functions rather than files. 


### python

[py-make](https://pypi.org/project/py-make/) appears to be a python version
of make.

