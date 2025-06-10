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
