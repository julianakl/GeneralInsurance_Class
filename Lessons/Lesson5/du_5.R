
library(dplyr)
library(ggplot2)
##install.packages("lubridate")
library(lubridate)

dt_Policy <- read.csv("D:/SSA/VTA/GeneralInsurance_Class/Data/lesson5_PolicyHistory.csv")
dt_Claims <- read.csv("D:/SSA/VTA/GeneralInsurance_Class/Data/lesson5_Claims.csv")

summary(dt_Policy)
head(dt_Policy)
dt_Policy %>% nrow()
dt_Policy %>% distinct(NrPolicy, NrObject) %>% nrow()

summary(dt_Claims)
head(dt_Claims)
dt_Claims %>% nrow()
dt_Claims %>% distinct(NrClaim) %>% nrow()
dt_Claims %>% distinct(NrPolicy, NrObject) %>% nrow()
##v datach Claims je jedinecnych kombinacii NrPolicy a NrObject menej ako celkovych PU,
##preto si zoskupim udaje podla NrPolicy a NrObject 
##poznamka: pre Burning costs nepotrebujem pocet PU

dt_Claims_upr<-dt_Claims %>% 
  group_by(NrPolicy, NrObject) %>% 
  summarise_at(vars(Paid, Reserves), funs(sum), na.rm = TRUE)

##kontrola
summary(dt_Claims_upr)
dt_Claims_upr %>% nrow()

##spojim udaje o PZ a PU
dt_pol_w_claims <- left_join(dt_Policy, 
                             dt_Claims_upr, 
                             by = c("NrPolicy", "NrObject")
)

dt_Policy %>% distinct(NrPolicy, NrObject) %>% nrow()
dt_pol_w_claims %>% nrow()

##vypocet expozicie
dt_pol_w_claims <- 
  dt_pol_w_claims %>% mutate(Time_Exposure = lubridate::dmy(Dt_Exp_End) - lubridate::dmy(Dt_Exp_Start))

##vypocet burning cost
dt_pol_w_claims <- 
  dt_pol_w_claims %>% 
  mutate(Ult_Loss = Paid + Reserves,
         Burning_Cost = ifelse(is.na(Ult_Loss), 0,  Ult_Loss / as.integer(Time_Exposure))
  )

## vyobrazim si 3 faktory, o ktorych predpokladam ze mozu mat vplyv na skodovost
## D_age_banded
## veh_type1
## Capacity
dt_pol_w_claims %>% 
  ggplot(aes(y = Burning_Cost, x = D_age_banded)) + 
  geom_jitter()

dt_pol_w_claims %>% 
  ggplot(aes(y = Burning_Cost, x = Veh_type1)) + 
  geom_jitter()

dt_pol_w_claims %>% 
  ggplot(aes(y = Burning_Cost, x = Capacity)) + 
  geom_jitter()

## pre GLM som si vybrala D_age_banded, niektore kateg. upravim
dt_pol_w_claims <- 
  dt_pol_w_claims %>% 
  mutate(D_age_banded_upr = case_when( D_age < 40 ~ 'x < 40',
                                       D_age < 50 ~ 'x <= 40 < 50',
                                       D_age < 60 ~ 'x <= 50 < 60',
                                       TRUE  ~ 'x >= 60'
                                       ) 
         )

dt_pol_w_claims %>% 
  ggplot(aes(y = Burning_Cost, x = D_age_banded_upr)) + 
  geom_jitter()

dt_pol_w_claims %>% 
  group_by(D_age_banded_upr) %>% 
  summarise(BC_avg = mean(Burning_Cost, na.rm  = TRUE),
            BC_median = median(Burning_Cost, na.rm = TRUE),
            cnt = n()) %>% 
  arrange(desc(D_age_banded_upr))
##podla tychto vysledov sa zda ze najhorsie vysledky su v kategorii >=60 cize s najvyssim vekom
##medzi ostatnymi kategoriami nie je velky rozdiel


##GLM
model2 <- glm(data = dt_pol_w_claims %>% filter(Burning_Cost != 0, Burning_Cost < 100),
              formula = Burning_Cost ~ D_age_banded_upr,
              family = Gamma())

summary(model2)


