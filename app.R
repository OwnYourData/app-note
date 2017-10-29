# top-level file for shiny app
# last update: 2017-09-19

# app wide constants and functions
source('constants.R')

server <- function(input, output, session) {
        source('appLogic.R', local=TRUE)
        tr <- callModule(srvLocalization, 'oyd')
        notif <- callModule(srvNotification, 'oyd', tr)
        appStart <- callModule(appServer, 'oyd', tr, notif)
        callModule(srvModule, 'oyd', tr, notif, appStart)
        # callModule(appServerLogic, 'oyd', tr)
}

shinyApp(ui = uiDesktop('oyd'), server = server)

# first start
# library(shiny); install.packages('~/oyd/oydapp/', repos=NULL, type='source'); library(oydapp); runApp('~/oyd/app-note', host='0.0.0.0', port=1251)
# afterwards
# detach('package:oydapp', unload = TRUE); install.packages('~/oyd/oydapp/', repos=NULL, type='source'); library(oydapp); runApp('~/oyd/app-note', host='0.0.0.0', port=1251)
