



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
