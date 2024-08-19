library(tidyverse)
library(rvest)
library(readxl)

# her finder vi data
url <- "https://us.ku.dk/studiestatistik/studiestatistikker/bestand/"

# Her gemmer vi data
data_sti <- "notes/20240816-sex-distribution-ucph/data/"  # relativ til projektet

data_sti <- "data/"  # relativ til projektet

# indlæser siden med data
siden <-  read_html(url)

# ekstraherer excel fil navne fra siden
excel_links <- siden %>%
  html_nodes("a") %>%
  html_attr("href") %>%
  grep("\\.xlsx$", ., value = TRUE) %>% 
  basename()

# disse filer har vi allerede
eksisterende_filer <- list.files(path = data_sti, full.names = FALSE)


filer_til_hentning <- base::setdiff(excel_links, eksisterende_filer)


# funktion til at downloade excel filerne
download_bestand <- function(x){
  download.file(paste0(url, x), paste0("notes/20240816-sex-distribution-ucph/data/", x), mode = "wb")
}

# downloader excel filerne - hvis der er nogen der skal hentes.
if(length(filer_til_hentning)>0){sapply(excel_links, download_bestand)}



# funktion til at ekstrahere data fra excelfilerne.
ekstraher_data <- function(fil){
  data <- read_xlsx(fil)
  år <- names(data)[1] %>% str_extract("\\d{4}")
  
  data %>% 
    rename(fag = 1) %>% 
    mutate(fakultet = case_when(
      fag == "Københavns Universitet" ~ "Alle",
      str_detect(fag, "Fakultet") ~ fag,
      .default = NA
    )) %>% 
    fill(fakultet, .direction = "down") %>% 
    filter(fakultet != "Alle") %>%
    filter(!str_detect(fag, "Fakultet")) %>% 
    mutate(niveau = case_when(
      fag == "Bachelor" ~ fag,
      fag == "Kandidat" ~ fag,
      .default = NA
    )) %>% 
    fill(niveau, .direction = "down") %>% 
    filter(!(fag %in% c("Bachelor","Kandidat"))) %>% 
    select(-Total) %>% 
    mutate(år = as.numeric(år))
  
}

# ekstraherer data fra alle excelfilerne
data <- list.files(path = data_sti, full.names = TRUE) %>% as_tibble() %>% 
  mutate(data = map(value, ekstraher_data))

# unnest data til langt format
data <- data %>% 
  select(-value) %>% 
  unnest(cols = data) %>% 
  pivot_longer(Kvinder:Mænd, names_to = "køn", values_to = "bestand")

# Lav fakultetsopdelt data

fak_data <- data %>% 
  group_by(år, fakultet, køn) %>% 
  summarise(bestand = sum(bestand)) %>% 
  mutate(andel = bestand/sum(bestand)*100)  %>% 
  ungroup()


fak_data <- fak_data %>%
  group_by(år, fakultet) %>%
  summarise(
    køn = "diff",
    bestand = abs(diff(bestand)),
    andel = abs(diff(andel))
  ) %>% 
  rbind(fak_data) %>% 
  ungroup()
