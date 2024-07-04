install.packages("ggplot2")
install.packages("dplyr")
install.packages("broom")
install.packages("ggpubr")

library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

heart.data=read.csv("C:/Users/Lancy/Desktop/heart.data.csv")

View(heart.data)

summary(heart.data)
cor(heart.data$biking, heart.data$smoking)

hist(heart.data$heart.disease)

plot(heart.disease ~ biking, data=heart.data)

plot(heart.disease ~ smoking, data=heart.data)



heart.disease.lm<-lm(heart.disease ~ biking + smoking, data=heart.data)
summary(heart.disease.lm)


#adjust plot margins
par(mar = c(1, 1, 1, 1))

par(mfrow=c(2,2))
plot(heart.disease.lm)

plotting.data <- expand.grid(
  biking=seq(min(heart.data$biking), max(heart.data$biking), length.out=30),
  smoking=c(min(heart.data$smoking), mean(heart.data$smoking), max(heart.data$smoking))
)

plotting.data$predicted.y <- predict.lm(heart.disease.lm, newdata=plotting.data)
View(plotting.data)

plotting.data$smoking <-round(plotting.data$smoking, digits=2)
View(plotting.data)

plotting.data$smoking <- as.factor(plotting.data$smoking)
View(plotting.data)

heart.plot <- ggplot(heart.data, aes(x=biking, y=heart.disease)) +
  geom_point()

heart.plot

heart.plot <- heart.plot +
  geom_line(data=plotting.data, aes(x=biking, y=predicted.y, color=smoking), size=1.25)

heart.plot

heart.plot <- heart.plot +
  geom_line(data=plotting.data, aes(x=biking, y=predicted.y, color=smoking), size=1.25)

heart.plot

heart.plot + annotate(geom="text", x=30, y=1.75, label=" = 15 + (-0.2*biking) + (0.178*smoking)")
