library(tidyverse)
library(rvest)
library(readxl)

url <- "https://us.ku.dk/studiestatistik/studiestatistikker/bestand/"
data_sti <- "notes/20240816-sex-distribution-ucph/data/"  # relativ til projektet
# indlæser siden

siden <-  read_html(url)

# ekstraherer excel fil navne fra siden
excel_links <- siden %>%
  html_nodes("a") %>%
  html_attr("href") %>%
  grep("\\.xlsx$", ., value = TRUE) %>% 
  basename()



# funktion til at downloade excel filerne
download_bestand <- function(x){
  download.file(paste0(url, x), paste0("notes/20240816-sex-distribution-ucph/data/", x), mode = "wb")
}

# downloader excel filerne
sapply(excel_links, download_bestand)

udvalg <- c("Københavns Universitet", "Bachelor", "Kandidat")
"notes/20240816-sex-distribution-ucph/data/KU_BESTAND_2015.xlsx"
ekstraher_overordnede_data <- function(sti){
data <- read_xlsx(sti)
år <- names(data)[1] %>% str_extract("\\d{4}")
data %>% 
  rename(var = 1) %>% 
  filter(var %in% udvalg | str_detect(var, "Fakultet")) %>% 
  mutate(fakultet = case_when(
    var == "Københavns Universitet" ~ "Alle",
    str_detect(var, "Fakultet") ~ var,
    .default = NA
  )) %>%
  mutate(år = år) %>% 
  fill(fakultet, .direction = "down") %>% 
  distinct() %>% 
  mutate(var = case_when(
    var == "Københavns Universitet" ~ "Alle",
    str_detect(var, "Fakultet") ~ var,
    .default = var  )) %>% 
  select(år, fakultet,
         niveau = var, 
          Kvinder, Mænd, Total) %>% 
  mutate(år = as.numeric(år))
}

list.files(path = data_sti, full.names = TRUE) %>% as_tibble() %>% 
  mutate(data = map(value, ekstraher_overordnede_data))


# og så er der noget galt i deres regneark for 2022. der sniger sig en ekstra
kandidat ind.
