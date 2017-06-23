install.packages("ggplot2")

# Check out the structure of titanic
str(MyData)

# Use ggplot2() for the first instruction
ggplot2(MyData, aes(x = factor(Pclass), fill = factor(Sex))) + geom_bar(position = "dodge")


# Use ggplot2() for the second instruction

ggplot2(MyData, aes(x = factor(Pclass), fill = factor(Sex))) + geom_bar(position = "dodge") + facet_grid(". ~ Survived")


# Position jitter (use below)
posn.j <- position_jitter(0.5, 0)

# Use ggplot2() for the last instruction
ggplot2(MyData, aes(x = factor(Pclass), y = Age, col = factor(Sex))) + geom_jitter(position = posn.j, size = 3, alpha = 0.5) + facet_grid(". ~ Survived")
