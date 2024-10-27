new_note <- function(title){
  dato <- format(Sys.time(), "%Y%m%d")
  dato_header <- format(Sys.time(), "%Y-%m-%d")
  
  path <- paste0("notes/",dato,"-", title)
  content <- c('---',
    'title: "indsæt title"',
  'subtitle: "indsæt subtitle"',
  'author: "Christian Knudsen"',
  'visible: "false" # sæt til noget andet når oplægget/noten er færdigt',
  'categories:',
  '  - kategori 1',
  '  - kategori 2',
  paste0('date: ',dato_header),
  'toc: true',
  'image: ""',
  '---')
  dir.create(path)
  fileConn<-file(paste0(path,"/","index.qmd"))
  writeLines(content, fileConn)
  close(fileConn)
}
