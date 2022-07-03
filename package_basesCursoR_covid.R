# Base de dados - Curso R ------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 03/07/22 ---------------------------------------------------------------------------------------------------------------------------

# Carregar pacotes ----------------------------------------------------------------------------------------------------------------------------

library(basesCursoR)
library(dplyr)
library(ggplot2)
library(magrittr)

# Identificar bases disponíveis ------------------------------------------------------------------------------------------------------------

basesCursoR::bases_disponiveis()

# Carregar base de dados -------------------------------------------------------------------------------------------------------------------

covid <- basesCursoR::pegar_base("covid")
View(covid)

# Selecionar dados -------------------------------------------------------------------------------------------------------------------------

covid1 <- covid %>%
  select(estado, semanaEpi, casosAcumulado) %>%
  filter(estado %in% c("RN", "SE", "CE", "PE", "PI", "MA", "BA", "PB", "AL"))
View(covid1)  

# Análises ---------------------------------------------------------------------------------------------------------------------------------

covid2 <- covid1 %>%
  group_by(estado, semanaEpi) %>%
  summarise(media = mean(casosAcumulado))

ggplot(covid2, aes(x = semanaEpi, y = media, 
                   col = estado, group = estado)) +
  geom_point() +
  geom_line()
