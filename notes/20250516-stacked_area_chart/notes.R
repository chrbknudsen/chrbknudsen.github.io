library(httr2)
library(rvest)

url <- "https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data"

# Byg request
req <- request(url) %>%
  req_options(http_version = 1L) %>%     # Tving HTTP/1.1
  req_user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64)") %>%
  req_headers(
    "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language" = "en-US,en;q=0.5",
    "Connection" = "keep-alive",
    "Upgrade-Insecure-Requests" = "1"
  ) %>%
  req_timeout(15) %>%
  req_retry(max_tries = 3)

# Udfør anmodning
resp <- req_perform(req)




library(httr)
library(rvest)

url <- "https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data"

res <- GET(
  url,
  user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36"),
  config = httr::config(http_version = 0)
)

html <- read_html(res)
html_table(url)
           
res <- curl::curl_fetch_memory(
  url,
  handle = curl::new_handle(
    http_version = 1L,
    useragent = "Mozilla/5.0"
  )
)
html <- read_html(rawToChar(res$content))




library(httr2)
library(rvest)

req <- request("https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data") |>
  req_user_agent("Mozilla/5.0") |>
  req_options(timeout = 60, http_version = 1)

resp <- req |> req_perform()
html <- read_html(resp)






tmp <- tempfile(fileext = ".xlsx")
download.file("https://www.nhmrc.gov.au/sites/default/files/documents/attachments/2023-funding-summary.xlsx", tmp, mode = "wb")
df <- readxl::read_excel(tmp)












library(chromote)
library(rvest)

b <- ChromoteSession$new()
b$Page$navigate(url)
b$Page$loadEventFired()
html <- b$Runtime$evaluate("document.documentElement.outerHTML")$result$value
doc <- read_html(html)
tbls <- doc %>% html_nodes("table") %>% html_table(fill=T)
tbls



# suk ------

install.packages("RSelenium")
library(RSelenium)
library(rvest)

remDr <- remoteDriver(browserName = "chrome", port = 4445L)
remDr$open()
remDr$navigate("https://www.nhmrc.gov.au/funding/outcomes-and-data-research/research-funding-statistics-and-data")
Sys.sleep(20)  # vent på sideindlæsning

page <- remDr$getPageSource()[[1]]
html <- read_html(page)
tables <- html %>% html_elements("table") %>% html_table(fill = TRUE)

length(tables)  # hvor mange tabeller blev fundet
head(tables[[1]])