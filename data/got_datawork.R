### John Hopkins Data Science Specialization Data Projects class project



got <- read.csv("got_survival.csv")

## models
house_mod <- glm(factor(survived)~age + go_to_wedding + children + gender + war + house, family = "binomial", data = got)


save.image("got_model.RData")

test <- data.frame(age = 35, go_to_wedding = "no", children = "no", war = "no", house = "nohouse", gender = "female")