my_packages = c('shiny', 
                'shinyjs',
                'shinyBS', 
                'devtools',
                'RCurl', 
                'httr',
                'jsonlite', 
                'sodium',
                'rjson',
                'dplyr',
                'tidyr', 
                'lubridate',
                'stringi',
                'digest',
                'rintrojs',
                'shinyAce')

install_if_missing = function(p) {
        if (p %in% rownames(installed.packages()) == FALSE) {
                install.packages(p, repos='https://cran.rstudio.org', dependencies=TRUE)
        }
        else {
                cat(paste('Skipping already installed package:', p, "\n"))
        }
}
invisible(sapply(my_packages, install_if_missing))

library(devtools)
install_github('trestletech/shinyStore')
install_github('rstudio/DT')
install_github('hadley/scales')
install_github('ropensci/plotly')
install.packages('/oydapp/', repos=NULL, type='source')