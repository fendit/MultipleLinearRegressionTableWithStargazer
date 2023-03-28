# R - Multiple Linear Regressions Table with Stargazer

See the Github page [here](https://fendit.github.io/MultipleLinearRegressionTableWithStargazer/)

#### Introduction

In this repository, I present a method to generate multiple linear regressions with a Latex regression table with [stargazer](https://cran.r-project.org/web/packages/stargazer/stargazer.pdf) (R package). The aim is to simplify regressions generation processes with user-defined set of Independent Variables (IVs) for each regression model and show all results in a regression table with stargazer. This is very helpful when adding new IVs in current equation gradually.

#### Example
Here [npk](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/npk.html) (R Datasets) is used for illustration. Three regresssions are generated using ```lm()```, with ```yield``` as dependent variable, as well as ```block``` and ```N``` as independent variables. 

First regression model:
> yield ~ block

Second:
> yield ~ N

Last:
> yield ~ block + N

Regression result is stored as ```doc``` format (easy for making table changes afterwards).

#### Reference
 Hlavac, Marek (2022). stargazer: Well-Formatted Regression and Summary Statistics Tables.
 R package version 5.2.3. https://CRAN.R-project.org/package=stargazer
