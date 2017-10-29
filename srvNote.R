# server logic to handle notes
# last update: 2017-10-15

observeEvent(input$noteList, {
        ns <- session$ns
        selItem <- input$noteList
        if(length(selItem)>1){
                selItem <- selItem[1]
                updateSelectInput(session,
                                  'noteList',
                                  selected = selItem)
        }
        app <- setupApp(session$userData$piaUrl,
                        session$userData$appKey,
                        session$userData$appSecret,
                        session$userData$keyItems)
        allNotes <- readItems(app, itemsUrl(app$url, appRepoDefault))

        updateTextInput(session, 
                        'noteTitle',
                        value = selItem)
        updateAceEditor(session, 
                        ns('noteEditor'),
                        value = as.character(
                                allNotes[allNotes$title == selItem, 'text']))
})

observeEvent(input$addNoteItem, {
        ns <- session$ns
        errMsg <- ''
        itemTitle <- input$noteTitle
        itemText <- input$noteEditor

        app <- setupApp(session$userData$piaUrl,
                        session$userData$appKey,
                        session$userData$appSecret,
                        session$userData$keyItems)
        url <- itemsUrl(app$url, appRepoDefault)
        allNotes <- readItems(app, url)
        
        if(itemTitle %in% allNotes$title){
                errMsg <- tr('msgNameInUse')
        }
        if(errMsg == ''){
                initNames <- as.character(allNotes$title)
                newItem <- list(title = itemTitle,
                                text = itemText)
                
                retVal <- writeOydItem(app, url, newItem)
                notif$writeItemsNotification(retVal)
                
                updateSelectInput(session,
                                  'noteList',
                                  choices = c(initNames, itemTitle),
                                  selected = NA)
                updateTextInput(session, 
                                'noteTitle',
                                value = '')
                updateAceEditor(session, 
                                ns('noteEditor'),
                                value = ' ')
        }
        if(errMsg != ''){
                shiny::showNotification(errMsg,
                                        type = 'error')
        }
})

observeEvent(input$updateNoteItem, {
        ns <- session$ns
        errMsg <- ''
        selItem <- input$noteList
        itemTitle <- input$noteTitle
        itemText <- input$noteEditor
        if(is.null(selItem)){
                errMsg <- tr('msgNoItemSelected')
        }
        if(errMsg == ''){
                app <- setupApp(session$userData$piaUrl,
                                session$userData$appKey,
                                session$userData$appSecret,
                                session$userData$keyItems)
                url <- itemsUrl(app$url, appRepoDefault)
                allNotes <- readItems(app, url)
                newNotes <- as.character(allNotes$title)
                currNote <- allNotes[allNotes$title == selItem, ]
                item <- list(title = itemTitle,
                             text = itemText)
                retVal <- writeOydItem(app, url, item, currNote$id, 
                        list(created_at = as.character(currNote$created_at)))
                notif$writeItemsNotification(retVal)
                newNotes <- replace(newNotes, newNotes == selItem, itemTitle)
                updateSelectInput(session,
                                  'noteList',
                                  choices = newNotes,
                                  selected = NA)
                updateTextInput(session, 
                                'noteTitle',
                                value = '')
                updateAceEditor(session, 
                                ns('noteEditor'),
                                value = ' ')
        } else {
                shiny::showNotification(errMsg,
                                        type = 'error')
        }
})

observeEvent(input$delNoteList, {
        ns <- session$ns
        errMsg <- ''
        selItem <- input$noteList
        if(is.null(selItem)){
                errMsg <- tr('msgNoItemSelected')
        }
        if(errMsg == ''){
                app <- setupApp(session$userData$piaUrl,
                                session$userData$appKey,
                                session$userData$appSecret,
                                session$userData$keyItems)
                url <- itemsUrl(app$url, appRepoDefault)
                allNotes <- readItems(app, url)
                currNote <- allNotes[allNotes$title == selItem, ]
                newNotes <- allNotes[allNotes$title != selItem, ]
                retVal <- deleteItem(app, url, currNote$id)
                notif$deleteItemNotification(retVal)
                updateSelectInput(session,
                                  'noteList',
                                  choices = newNotes$title,
                                  selected = NA)
                updateTextInput(session, 
                                'noteTitle',
                                value = '')
                updateAceEditor(session, 
                                ns('noteEditor'),
                                value = ' ')
        } else {
                shiny::showNotification(errMsg,
                                        type = 'error')
        }
})

observeEvent(input$resetNoteForm, {
        ns <- session$ns
        updateSelectInput(session,
                          'noteList',
                          selected = NA)
        updateTextInput(session, 
                        'noteTitle',
                        value = '')
        updateAceEditor(session, 
                        ns('noteEditor'),
                        value = ' ')
})
