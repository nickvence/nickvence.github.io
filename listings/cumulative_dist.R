library(tidyverse)

x <- 0:20          #Domain
dy <- dgeom(x, .1) #Probability density
py <- pgeom(x, .1) #Cumulative probability distribution

tibble(x, dy, py) %>% 
ggplot(aes(x)) +
  geom_col(aes(y = py), fill = "grey60") +
  geom_col(aes(y = dy), fill = "grey40") +
  scale_x_continuous(breaks = x) +
  geom_hline(yintercept = 1, color = "red", linetype = "dashed") +
  labs(x="", y="", title = "Cumulative Probability (and probability density)") +
  theme(plot.title = element_text(hjust = 0.5)) + #Centering title
  ggsave("cumulative_dist.png")
