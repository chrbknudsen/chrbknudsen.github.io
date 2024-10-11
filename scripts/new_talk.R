new_talk <- function(title){
  dato <- format(Sys.time(), "%Y%m%d")
  dato_header <- format(Sys.time(), "%Y-%m-%d")
  
  path <- paste0("notes/",dato,"-", title)
  content <- c('---',
               paste0('title: ', title),
               'subtitle: "indsæt subtitle"',
               'author: "Christian Knudsen"',
               'categories:',
               '  - kategori 1',
               '  - kategori 2',
               paste0('date: ',dato_header),
               'toc: true',
               'image: ""',
               'format:', 
               '  revealjs:', 
               '    theme: serif',
               '    logo: logo.png',
               '    css: logo.css',
               '---')
  dir.create(path)
  fileConn<-file(paste0(path,"/","index.qmd"))
  writeLines(content, fileConn)
  close(fileConn)
}

