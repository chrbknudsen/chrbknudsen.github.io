
# Indlæs nødvendige pakker
library(ggplot2)
library(dplyr)
library(danstat)


danstat::get_table_metadata("AMR2")

variables <- list(list(code = "KØN", values = c("M","K")),
                  list(code = "SOCIO", values = "021"),
                  list(code = "ALDER", values = NA),
                  list(code = "TID", values = 2022))


data <- danstat::get_data("AMR2", variables = variables, language = "da")
data <- data %>% select(-c(TID, SOCIO)) %>% 
  arrange(ALDER) %>% 
  group_by(ALDER) %>% 
  mutate(TOTAL = sum(INDHOLD),
         andel = INDHOLD/TOTAL) 

head(data)

data %>% 
  select(ALDER) %>% distinct()

data %>% 
  filter(ALDER %in% c("67 år og derover",
                      "Under 16 år")) %>% 
  ggplot(aes(x = "", y = andel, fill = KØN)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  facet_wrap(~ALDER, ncol = 4, strip.position = "bottom") +
  labs(
    title = "Tilknytning til arbejdsmarkedet (fuldtidspersoner)",
    subtitle = "Ordinær beskæftigelse i alt (2022)",
    fill = "Køn"
  ) +
  geom_text(aes(
    label = paste0(
      scales::number(INDHOLD, big.mark = "."), "\n", scales::percent(andel, accuracy = 0.1, decimal.mark = ",")  # Kombiner INDHOLD og andel
    )
  ), position = position_stack(vjust = 0.5), size = 4) +
  theme_void() +
  theme(
    strip.text = element_text(size = 12, face = "bold", color = "white"), # Aldergrupper over diagrammerne
    strip.placement = "outside",
    plot.title = element_text(size = 16, face = "bold", color = "white"),
    plot.subtitle = element_text(size = 14, color = "white"),
    legend.title = element_text(size = 12, color = "white"),
    legend.text = element_text(size = 10, color = "white"),
    legend.position = "top",
    plot.background = element_rect(fill = "black")
  )






"16-19 år",
"20-24 år",
"25-29 år",
"30-34 år",
"35-39 år",
"40-44 år",
"45-49 år",
"50-54 år",
"55-59 år",
"60-64 år",
"65-66 år",
"67 år og derover",
"Under 16 år"
