# Comments

all: clarityI1.png all.png


# Figure files

clarityI1.png: combined.csv create_graphic.R create_I1_graphic.R
	Rscript --vanilla create_I1_graphic.R

all.png: combined.csv create_graphic.R create_all_graphic.R
	Rscript --vanilla create_all_graphic.R

# Data

combined.csv: Fair.csv Good.csv Ideal.csv Premium.csv VeryGood.csv combine_data.R
	Rscript --vanilla combine_data.R
