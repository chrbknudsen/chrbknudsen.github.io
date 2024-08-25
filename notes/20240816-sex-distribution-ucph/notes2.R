
head(fak_data)

fak_data %>% 
  select(-bestand) %>% 
  pivot_wider(names_from = "køn", values_from = "andel") %>% 
    mutate(across(c(4,5), ~ . - 50)) %>% 
  pivot_longer(cols = diff:Mænd, values_to = "andel", names_to = "køn") %>% 
  ggplot(aes(år, andel, color = køn)) +
  geom_point() +
  geom_line() +
  facet_wrap(~fakultet) +
  ylim(c(-60,60))


fak_data %>%   
ggplot(aes(år,andel, color = fct_relevel(køn, c("Kvinder", "Mænd", "diff")))) +
  geom_line() +
  geom_point() +
  theme_bw() +
  ylim(c(0,100)) +
  facet_wrap(~fakultet) +
  ggtitle(label = "Science er i mål, Teologi er på rette kurs.",
          subtitle = "Resten går den gale vej.") +
  ylab("Andel af studenterbestand (%)")+ 
  xlab("")+
  theme(legend.title = element_blank()) +
  scale_color_manual(values = c("diff" = "red", "Kvinder" = "purple", "Mænd" = "darkgrey"),
                     labels = c("diff" = "Abs. Forskel (%-point)", "Kvinder" = "Kvinder", "Mænd" = "Mænd")) +
  labs(caption = "Udviklingen i kønsfordelingen på KUs fakulteter 2014-2023
          Rå data: https://us.ku.dk/studiestatistik/studiestatistikker/bestand/")




fak_data %>% 
  filter(køn == "diff") %>% 
  select(-bestand) %>% 
  mutate(farve = factor(sign(andel))) %>% 
   ggplot(aes(år, andel, group = fakultet, color = farve)) +
  geom_point()+
  geom_line() +
  facet_wrap(~fakultet) +
  ggtitle(label = "Forskel på andelen af kvinder og mænd",
          subtitle = "En værdi på 50% svarer til en 70-20 fordeling i kvinders favør") +
    labs(caption = "Udviklingen i kønsfordelingen på KUs fakulteter 2014-2023
          Rå data: https://us.ku.dk/studiestatistik/studiestatistikker/bestand/") +
  ylab("Andel af studenterbestand (%)")+ 
  xlab("") +
  theme_bw() +
  scale_color_manual(values = c("1" = "green", "-1" = "red"),
                     labels = c("1" = "Alt ok", "-1" = "Problem"))

