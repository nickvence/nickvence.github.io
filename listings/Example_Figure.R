library(tidyverse)
#Example Figure

rate <- .5
df <- tibble(decay = rexp(100, rate))

p1 <- ggplot(df, aes(x = decay)) +
  geom_histogram(breaks = 0:8) +
  scale_x_continuous(breaks = 0:8) +
  geom_function(fun = rlang::as_function(~ 100 * dexp(.x, rate)), color = "red") +
  labs(x = "", y = "") +
  theme_bw()

ggsave("Example_Figure.png", p1)
