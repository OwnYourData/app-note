# layout for Analysis section
# last update: 2017-06-11

uiAnalysis <- function(ns){
        tabsetPanel(type='tabs',
                tabPanel(uiOutput(ns('ctrlTrnsl_tabNotepad')), br(),
                        fluidRow(column(4,
                                selectInput(ns('noteList'),
                                        uiOutput(ns('ctrlTrnsl_noteList')),
                                        list(),
                                        multiple = TRUE,
                                        selectize = FALSE,
                                        size = 20),
                                actionButton(ns('delNoteList'),
                                        uiOutput(ns('ctrlTrnsl_delNoteList'),
                                                 style='display: inherit;'),
                                        icon('trash'))),
                        column(8,
                                textInput(ns('noteTitle'),
                                        uiOutput(ns('ctrlTrnsl_noteTitle')),
                                        value = ''),
                               aceEditor(ns('noteEditor'), 
                                         value = '',
                                         height = '300px'),
                               br(),
                               actionButton(ns('addNoteItem'),
                                        uiOutput(ns('ctrlTrnsl_addNoteItem'),
                                                 style='display: inherit;'),
                                        icon('plus')),
                               actionButton(ns('updateNoteItem'),
                                        uiOutput(ns('ctrlTrnsl_updateNoteItem'),
                                                 style='display: inherit;'),
                                        icon('edit')),
                               actionButton(ns('resetNoteForm'),
                                        uiOutput(ns('ctrlTrnsl_resetNoteForm'),
                                                 style='display: inherit;'),
                                        icon('undo'))))
                ),
                tabPanel(uiOutput(ns('ctrlTrnsl_tabSearch')), br(),
                         p('suchen...'))
        )
}
