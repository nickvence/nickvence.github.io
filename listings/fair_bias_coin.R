library(tidyverse)

ggplot(mtcars, aes(wt, mpg)) +
  geom_point()

n <-  0:20
color <- rep("grey50", length(n))
color[12] = "red"
df <- tibble(n = n,
             fair = dbinom(n, 20, .5),
             biased = dbinom(n, 20, .75),
             color = color) %>% 
  pivot_longer(c("fair","biased"))

ggplot(df) +
  xlim(min(n), max(n)) +
  geom_col(aes(x = n, y = value, fill = color)) +
  facet_grid(name ~ .) +
  scale_fill_manual(values = c("grey50", "red")) +
  labs(x = "Flips", y = "Probability") +
  theme(legend.position = "none") +
  ggsave("fair_bias_coin.png")
