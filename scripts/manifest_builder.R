# Installer og indlæs nødvendige pakker
#install.packages(c("fs", "digest"))
library(fs)
library(digest)

# Definér den mappe, der skal gennemgås (f.eks. din Quarto-uddata)
website_dir <- "docs"

# Find alle filer i mappen (rekursivt)
files <- dir_ls(website_dir, recurse = TRUE, type = "file")

# Beregn SHA256-hash for hver fil og gem i en data frame
manifest <- data.frame(
  file = files,
  sha256 = sapply(files, function(f) digest(file = f, algo = "sha256")),
  stringsAsFactors = FALSE
)

# Gem manifestet til en tekstfil (fx CSV eller plain text)
write.csv(manifest, file = file.path(website_dir, "manifest.csv"), row.names = FALSE)