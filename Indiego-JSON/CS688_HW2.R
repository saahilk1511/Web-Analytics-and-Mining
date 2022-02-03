################################# CS688 Assignment 2 ####################################
# @author: Sahil Khanna
# BU ID: U86445364
# Last edit: Oct, 1st 2021
library("car") # for qqPlot
library(ggplot2)
library("effsize")

df <- read.csv("dataset.csv", header = T)
df <- df[2:5]

edu <- subset(df, df$Category %in% "Education")
qqPlot(edu$Count, main = "Education", ylab="Count")

egt <- subset(df, df$Category %in% "Energy & Green Tech")
qqPlot(egt$Count, main = "Energy & Green Tech", ylab="Count")

hf <- subset(df, df$Category %in% "Health & Fitness")
qqPlot(hf$Count,  main = "Health & Fitness", ylab="Count")

fw <- subset(df, df$Category %in% "Fashion & Wearables")
qqPlot(fw$Count,  main = "Fashion & Wearables", ylab="Count")

well <- subset(df, df$Category %in% "Wellness")
qqPlot(well$Count, main = "Wellness", ylab="Count")

# Education
ed_p <- ggplot(edu, aes(x=Count)) + 
  geom_density(color="darkblue", fill="red") + 
  geom_vline(aes(xintercept=mean(Count)),
              color="blue", linetype="dashed", size=1) + 
  labs(title="Education Density plot")
ed_p

# Energy & Green Tech
egt_p <- ggplot(egt, aes(x=Count)) + 
  geom_density(color="darkblue", fill="red") + 
  geom_vline(aes(xintercept=mean(Count)),
             color="blue", linetype="dashed", size=1) + 
  labs(title="Energy & Green Tech Density plot")
egt_p

# Health & Fitness
hf_p <- ggplot(hf, aes(x=Count)) + 
  geom_density(color="darkblue", fill="red") + 
  geom_vline(aes(xintercept=mean(Count)),
             color="blue", linetype="dashed", size=1) + 
  labs(title="Health & Fitness Density plot")
hf_p

# Fashion & Wearables
fw_p <- ggplot(fw, aes(x=Count)) + 
  geom_density(color="darkblue", fill="red") + 
  geom_vline(aes(xintercept=mean(Count)),
             color="blue", linetype="dashed", size=1) + 
  labs(title="Fashion & Wearables Density plot")
fw_p

# Wellness
well_p <- ggplot(well, aes(x=Count)) + 
  geom_density(color="darkblue", fill="red") + 
  geom_vline(aes(xintercept=mean(Count)),
             color="blue", linetype="dashed", size=1) + 
  labs(title="Wellness Density plot")
well_p

# Question 2.a)
## T-test parametric test

x <- subset(hf$Count, hf$Year %in% c("2018","2019","2020"))
y <- subset(fw$Count, fw$Year %in% c("2018","2019","2020"))
t.test(x, y)

## Non-parametric tests
ks.test(x,y)
wilcox.test(x,y)

# Question 2.b)

cohen.d(x,y,return.dm=TRUE)


# Question 3
cor.test(x,y, alternative = "two.sided",method= "pearson", conf.level = 0.95 )
cor.test(x,y, alternative = "two.sided",method= "spearman", conf.level = 0.95 )
cor.test(x,y, alternative = "two.sided",method= "kendall", conf.level = 0.95 )



