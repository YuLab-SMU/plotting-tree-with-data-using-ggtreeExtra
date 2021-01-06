# Makefile

rd:
	Rscript -e 'rmarkdown::render("README.Rmd")'

create_data:
	cd scripts;\
	Rscript create_tree_and_dataframe.R

supple:
	cd Rmarkdown;\
	Rscript -e 'rmarkdown::render("supplementary_file.Rmd")';\

clean:
	rm Rmarkdown/supplementary_file.log
