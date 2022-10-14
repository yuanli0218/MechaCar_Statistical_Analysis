library(dplyr)

# 1
mecha = read.csv("MechaCar_mpg.csv")

model1 = lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, mecha)

summary(model1)

# 2
suscoil = read.csv("Suspension_Coil.csv")

total_summary =
  suscoil %>%
  summarise(Mean = mean(PSI), 
            Median = median(PSI), 
            Variance = var(PSI),
            SD = sd(PSI),
            )


lot_summary =
  suscoil %>%
  group_by(Manufacturing_Lot) %>%
  summarise(Mean = mean(PSI), 
            Median = median(PSI), 
            Variance = var(PSI),
            SD = sd(PSI),
  )

# 3
t.test(x=suscoil$PSI, 
       mu=1500,
       alternative="two.sided"
       )

t.test(subset(suscoil,Manufacturing_Lot =="Lot1")$PSI,mu = 1500)
t.test(subset(suscoil,Manufacturing_Lot =="Lot2")$PSI,mu = 1500)
t.test(subset(suscoil,Manufacturing_Lot =="Lot3")$PSI,mu = 1500)