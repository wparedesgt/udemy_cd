#Etiquetas y Leyendas

#ggtitle()
#xlab()
#ylab()
#labs(...)

library(tidyverse)

data("ToothGrowth")

head(ToothGrowth)


#boxplot Etiquetas

ToothGrowth %>% ggplot(aes(dose, len, fill = as.factor(dose))) +
  geom_boxplot() +
  ggtitle("Crecimiento Dental función medicamento (mg/d) vitamina 'C'") +
  xlab("Dosis de vitamina C (mg/dia)") +
  ylab("Crecimiento dental (en mm)") +
  labs(fill = "Dosis en mg/día") +
  theme(legend.position = "bottom") +
  guides(fill = FALSE)

#Temas

ToothGrowth %>% ggplot(aes(dose, len)) + 
  geom_boxplot() +
#  theme_bw() +
#  theme_dark()
#  theme_classic()
  theme_gray() +
#  theme(plot.background = element_rect(fill = "darkblue"))
  theme(axis.text.x = element_text(face = "bold", 
                                   family = "Courier New", 
                                   size = 14, 
                                   angle = 45, 
                                   color = "#FF0000"), 
        axis.text.y = element_text(face = "italic", 
                                   family = "Courier",
                                   size = 16, 
                                   angle = 30, 
                                   color = "#449955")) +
  theme(panel.border = element_blank()) +
  theme(panel.grid.major = element_blank()) +
  theme(panel.grid.minor = element_blank())


