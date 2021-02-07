 
  
#Color info:   display.brewer.all()
## Line Plot: take2
ggplot(d20c, aes(x=month, y=deaths, group = cause, color = cause)) +
  geom_line() +
  facet_grid(year ~ .) +
  labs(caption = "data.cdc.gov/NCHS/Weekly-Counts-of-Death-by-State-and-Select-Causes/muzy-jte6",
       title = "Deaths vs Time") +
  theme(axis.text.x = element_text(angle = 90),
        plot.title = element_text(hjust = 0.5, size = 18)) +
  ggsave("/Users/nvence/prog/COVID-19/data_CDC/line_chart.png")


prob <- c(0.333, 0.361, 0.181)
cumsum(prob)
eps = 0.001
curve(log(x/(1 - x)), eps, 1-eps, 500)
curve(x/(1 - x), eps, 1-eps, 500)
box = 3
curve(exp(x) - exp(-x), -box, box, 100)

