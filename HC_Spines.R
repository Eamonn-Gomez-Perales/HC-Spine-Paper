library(ggplot2)
library(dplyr)
library(tidyr)
library(ggsignif)
library(rstatix)
library(tidyverse)
library(effsize)
library(lme4)
library(lmerTest)
library(emmeans)
library(effectsize)

spinedata<-read.csv('Spines_data.csv')

mydata<-spinedata %>% 
  group_by(Decoded,Group) %>% 
  summarise(spine_dens=mean(Total.Spine.Density), mature_spine_dens=mean(Mature.Spine.Density,), prop_mature=mean(Prop_Mature))

Figure_2<-ggplot(data=mydata, aes(x=factor(Group, level=c('EE','LNG','EE+LNG','Diestrus','Pro','Estrus')), y=spine_dens, group=factor(Group, level=c('EE','LNG','EE+LNG','Diestrus','Pro','Estrus'))))+
  stat_summary(geom = 'bar', fun = 'mean', fill ='grey85', color='black')+
  stat_summary(geom='errorbar', fun.data = mean_se, width=.3)+
  theme_classic()+
  theme(text = element_text(family = "Arial", size = 20, color = "black"),title = element_text(face = "bold"), axis.text = element_text(color = "black"), axis.line = element_line(color = "black", linewidth = 0.5), axis.ticks = element_line(color = "black"),)+
  theme(legend.position = 'none')+
  xlab('')+
  ylab('Dendritic Spine Density (/10µm)')+
  ggtitle('Total Dendritic Spine Density (/10µm)')+
  theme(plot.title=element_text(hjust = 0.5,face='bold',size = 20), axis.text.x=element_text(colour="black", size=15), axis.text.y=element_text(colour="black", size=15), axis.title.y = element_text(size = 15))+
  geom_point(position = position_jitter(width = 0.08, height = 0),
             size = 1,
             stroke = 0.5,
             colour = "black")+
  scale_y_continuous(
    limits = c(0, 25),
    expand = expansion(mult = c(0, 0.02)))+
  scale_x_discrete(
    labels = c(
      "EE" = "EE",
      "LNG" = "LNG",
      "EE+LNG" = "EE+LNG",
      "Diestrus" = "Diestrus",
      "Pro" = "Proestrus",
      "Estrus" = "Estrus"))+
  scale_fill_grey()+
  geom_signif(y_position = c(22), xmin = c(5), xmax = c(6),
              map_signif_level = TRUE, annotations = '*',tip_length = 0.01, textsize = 6, fontface= "bold")+
  geom_signif(y_position = c(24), xmin = c(1), xmax = c(6),
              map_signif_level = TRUE, annotations = '*',tip_length = 0.01, textsize = 6, fontface= "bold")

Figure_2

ggsave(
  filename = "Figure_2.pdf",
  plot     = Figure_2,
  device   = cairo_pdf,       
  width    = 7,             
  height   = 6,             
  units    = "in"             
)

Figure_3<-ggplot(data=mydata, aes(x=factor(Group, level=c('EE','LNG','EE+LNG','Diestrus','Pro','Estrus')), y=mature_spine_dens, fill=factor(Group, level=c('EE','LNG','EE+LNG','Diestrus','Pro','Estrus'))))+
  stat_summary(geom = 'bar', fun = 'mean', fill ='grey85', color='black')+
  stat_summary(geom='errorbar', fun.data = mean_se, width=.3)+
  theme_classic()+
  theme(legend.position = 'none')+
  xlab('')+
  ylab('Mature Dendritic Spine Density (/10µm)')+
  ggtitle('Mature Dendritic Spine Density (/10µm)')+
  theme(plot.title=element_text(hjust = 0.5,face='bold',size = 20), axis.text.x=element_text(colour="black", size=15), axis.text.y=element_text(colour="black", size=15), axis.title.y = element_text(size = 15))+
  geom_point(position = position_jitter(width = 0.08, height = 0),
             size = 1,
             stroke = 0.5,
             colour = "black")+
  scale_y_continuous(
    limits = c(0, 6),
    expand = expansion(mult = c(0, 0.02)))+
  scale_x_discrete(
    labels = c(
      "EE" = "EE",
      "LNG" = "LNG",
      "EE+LNG" = "EE+LNG",
      "Diestrus" = "Diestrus",
      "Pro" = "Proestrus",
      "Estrus" = "Estrus"))+
  scale_fill_grey()+
  geom_signif(y_position = c(5.5), xmin = c(5), xmax = c(6),
              map_signif_level = TRUE, annotations = '*',tip_length = 0.01, textsize = 6, fontface= "bold")

ggsave(
  filename = "Figure_3.pdf",
  plot     = Figure_3,
  device   = cairo_pdf,       
  width    = 7,             
  height   = 6,             
  units    = "in"             
)

Figure_4<-ggplot(data=mydata, aes(x=factor(Group, level=c('EE','LNG','EE+LNG','Diestrus','Pro','Estrus')), y=prop_mature, fill=factor(Group, level=c('EE','LNG','EE+LNG','Diestrus','Pro','Estrus'))))+
  stat_summary(geom = 'bar', fun = 'mean', fill ='grey85', color='black')+
  stat_summary(geom='errorbar', fun.data = mean_se, width=.3)+
  theme_classic()+
  theme(legend.position = 'none')+
  xlab('')+
  ylab('Proportion of Mature Dendritic Spines')+
  ggtitle('Proportion of Mature Dendritic Spines')+
  theme(plot.title=element_text(hjust = 0.5,face='bold',size = 20), axis.text.x=element_text(colour="black", size=15), axis.text.y=element_text(colour="black", size=15), axis.title.y = element_text(size = 15))+
  geom_point(position = position_jitter(width = 0.08, height = 0),
             size = 1,
             stroke = 0.5,
             colour = "black")+
  scale_y_continuous(
    limits = c(0, 0.5),
    expand = expansion(mult = c(0, 0.02)))+
  scale_x_discrete(
    labels = c(
      "EE" = "EE",
      "LNG" = "LNG",
      "EE+LNG" = "EE+LNG",
      "Diestrus" = "Diestrus",
      "Pro" = "Proestrus",
      "Estrus" = "Estrus"))+
  scale_fill_grey()+
  geom_signif(y_position = c(0.4), xmin = c(5), xmax = c(6),
              map_signif_level = TRUE, annotations = '*',tip_length = 0.01, textsize = 6, fontface= "bold")+
  geom_signif(y_position = c(0.45), xmin = c(3), xmax = c(6),
              map_signif_level = TRUE, annotations = '*',tip_length = 0.01, textsize = 6, fontface= "bold")

ggsave(
  filename = "Figure_4.pdf",
  plot     = Figure_4,
  device   = cairo_pdf,       
  width    = 7,             
  height   = 6,             
  units    = "in"             
)


############# Total LME


model <- lmer(
  Total.Spine.Density ~ Group * Basalor.Apical +
    (1 | Decoded) +
    (1 | Decoded:Neuron),
  data = spinedata
)

anova(model)
summary(model)

model_final <- lmer(
  Total.Spine.Density ~ Group + Basalor.Apical +
    (1 | Decoded) +
    (1 | Decoded:Neuron),
  data = spinedata
)

anova(model_final)
summary(model_final)

####
emm <- emmeans(model_final, ~ Group)

pairs(emm, adjust = "tukey")

emm <- emmeans(model_final, ~ Group)

summary(emm)


effectsize::eta_squared(
  anova(model_final, type = 3),
  partial = TRUE
)

total_emm <- emmeans(model_final, ~ Group)

total_pairs <- pairs(total_emm, adjust = "tukey")

total_d <- eff_size(
  total_pairs,
  sigma = sigma(model_final),
  edf = df.residual(model_final),
  method = "identity"
)

summary(total_d)

###################################Mature_LME

mature_model <- lmer(
  Mature.Spine.Density ~ Group + Basalor.Apical +
    (1 | Decoded) +
    (1 | Decoded:Neuron),
  data = spinedata
)

summary(mature_model)
anova(mature_model, type = 3)

mature_emm <- emmeans(mature_model, ~ Group)

pairs(mature_emm, adjust="tukey")


eta_squared(
  anova(mature_model, type = 3),
  partial = TRUE
)
#######Prop GLMM

mature_prop_model<-glmer(
  cbind(Mature.Spines, Total.Spines - Mature.Spines) ~
    Group + Basalor.Apical +
    (1|Decoded),
  family = binomial,
  data = spinedata
)

summary(mature_prop_model)
anova(mature_prop_model, test="Chisq")



prop_emm <- emmeans(
  mature_prop_model,
  ~ Group,
  type="response"
)

summary(prop_emm)

pairs(prop_emm, adjust="tukey")

drop1(mature_prop_model, test = "Chisq")
#########Descriptives

total_desc <- spinedata %>%
  group_by(Decoded, Group) %>%
  summarise(
    Total = mean(Total.Spine.Density),
    .groups = "drop"
  ) %>%
  group_by(Group) %>%
  summarise(
    M = mean(Total),
    SD = sd(Total),
    n = n()
  )

total_desc

mature_desc <- spinedata %>%
  group_by(Decoded, Group) %>%
  summarise(
    Mature = mean(Mature.Spine.Density),
    .groups = "drop"
  ) %>%
  group_by(Group) %>%
  summarise(
    M = mean(Mature),
    SD = sd(Mature),
    n = n()
  )

mature_desc

prop_desc <- spinedata %>%
  group_by(Decoded, Group) %>%
  summarise(
    Prop = sum(Mature.Spines) / sum(Total.Spines),
    .groups = "drop"
  ) %>%
  group_by(Group) %>%
  summarise(
    M = mean(Prop),
    SD = sd(Prop),
    n = n()
  )

prop_desc

