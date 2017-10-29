# application specific logic
# last update: 2017-06-11

# Code required for every app ========================
# initialization
session$userData$piaUrl <- ''
session$userData$appKey <- ''
session$userData$appSecret <- ''
session$userData$keyItems <- data.frame()
session$userData$initFlag <- TRUE
session$userData$openDialog <- ''

appServer <- function(input, output, session, tr, notif){
        source('srvNote.R', local = TRUE)       

        appStart <- function(){
                ns <- session$ns
                app <- setupApp(session$userData$piaUrl,
                                session$userData$appKey,
                                session$userData$appSecret,
                                session$userData$keyItems)
                repo_url <- itemsUrl(app$url, appRepoDefault)
                items <- readItems(app, repo_url)
                notif$readItemsNotification(items)
                noteList(ns)
        }
        
        return(appStart)
}

# App specific code =======================================
noteList <- function(ns){
        app <- setupApp(session$userData$piaUrl,
                        session$userData$appKey,
                        session$userData$appSecret,
                        session$userData$keyItems)
        allNotes <- readItems(app, itemsUrl(app$url, appRepoDefault))
        updateSelectInput(
                session,
                ns('noteList'),
                choices = allNotes$title,
                selected = NA
        )
}

