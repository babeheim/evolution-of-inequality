evolution-of-inequality
============

Data processing and figure script for "The Evolution of Inequality", by Siobhán M. Mattison, Eric A. Smith, Mary K. Shenk, Ethan E. Cochrane, in Evolutionary Anthropology (for this manuscript, I am acknowledged for preparing and analyzing the data, and created the figures)
DOI: https://doi.org/10.1002/evan.21491

The ice core data used in Figure 1 and Figure 2 was extracted directly from Petit JR, Jouzel J, Raynaud D, et al. (1999) "Climate and atmospheric history of the past 420,000 years from the Vostok ice core, Antarctica." Nature 399:429–43, DOI: https://doi.org/10.1038/20859, Figure 3.

# Instructions:

In R, set the working directory to that containing this readme file. For example, on a Mac or Linux machine, you might type into the command prompt

```
  setwd('~/Desktop/evolution-of-inequality')
```

if the folder containing the project is named 'evolution-of-inequality' and on your Desktop. You can tell if you are in the right place by typing in `dir()` and seeing this readme.txt file as well as:

- `pathdata.txt` - raw path data exported from Figure 3 of Petit, et al. (1999)

- `climate temps.svg` - the journal page in which Figure 3 appears, converted from PDF to SVG; I manually extracted `pathdata.txt` from this file

- `make_figures.r` - a short R script for extracting and preparing the key temperature figure that appears in Figure 1 and Figure 2 of Mattison, *et al.*

The analysis itself is relatively straightforward, and can be re-run by typing:

```
  source('./make_figures.r')
```

with the project folder as the working directory. If all goes well, a new file named 'petit-1999-climate-stability.png' will be created that contains the ice core temperature data as a logarithmic time series.

The project is maintained by Bret Beheim (beheim@gmail.com) and is hosted at https://github.com/babeheim.

