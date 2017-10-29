# global constants available to the app
# last update: 2017-06-11

# required Libraries
library(shiny)
library(shinyjs)
library(shinyBS)
library(rintrojs)
library(sodium)
library(oydapp)
library(shinyAce)

# sources for user specific UI
source('uiAnalysis.R')
source('uiSource.R')
source('uiReport.R')

# IMPORTANT NOTE: these variables are shared between ALL user sessions!

# constants required for every app
appName <- 'note'
appTitle <- 'Notizen'
app_id <- 'eu.ownyourdata.note'
appRepoDefault <- app_id
helpUrl <- 'https://www.ownyourdata.eu/apps/notizen'

# console logging
oydLog <- function(msg)
        cat(paste(Sys.time(), msg, "\n"))
oydLog('App start')

# Version information
currVersion <- "0.3.0"
verHistory <- data.frame(rbind(
        c(version = "0.3.0",
          text    = "erstes Release")
))

# translations for app specific localizations
localization <- list(
        'ctrlTrnsl_appTitle' = list('de' = 'Notizen', 
                                    'en' = 'Notes'),
        'ctrlTrnsl_tabNotepad' = list('de' = 'Notizblock', 
                                    'en' = 'Notepad'),
        'ctrlTrnsl_noteList' = list('de' = 'Liste deiner Notizen',
                                    'en' = 'List of your notes'),
        'ctrlTrnsl_delNoteList' = list('de' = 'Löschen',
                                       'en' = 'Delete'),
        'ctrlTrnsl_noteTitle' = list('de' = 'Titel',
                                     'en' = 'Title'),
        'ctrlTrnsl_addNoteItem' = list('de' = 'Hinzufügen',
                                       'en' = 'Add'),
        'ctrlTrnsl_updateNoteItem' = list('de' = 'Aktualisieren',
                                          'en' = 'Update'),
        'ctrlTrnsl_resetNoteForm' = list('de' = 'Zurücksetzen',
                                         'en' = 'Reset'),
        'msgNoItemSelected' = list('de' = 'keine Notiz ausgewählt',
                                  'en' = 'no note selected'),
        'ctrlTrnsl_tabSearch' = list('de' = 'Suchen', 
                                     'en' = 'Search'),
        'ctrlTrnsl_repoName' = list('de' = 'Liste:', 'en' = 'Repo:')
)

# app specific constants ==================================
