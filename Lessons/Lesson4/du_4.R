library(dplyr)
library(ggplot2)
library(ChainLadder)

dt_PaidCase <- read.csv("D:/SSA/VTA/GeneralInsurance_Class/Data/lesson4_PaidCase.csv")
summary(dt_PaidCase)

##paid data for House business and Small claim size
Paid_HH_sml <- dt_PaidCase %>% filter(Business == "House", 
                                      ClaimSize == "Small", 
                                      dataset_type == "PAID")
Paid_HH_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount")
Paid_HH_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% ata()
Paid_HH_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% plot()
Paid_HH_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict()
Paid_HH_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict() %>% plot()


##paid data for House business and Large claim size
Paid_HH_lrg <- dt_PaidCase %>% filter(Business == "House", 
                                      ClaimSize == "Large", 
                                      dataset_type == "PAID")
Paid_HH_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount")
Paid_HH_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% ata()
Paid_HH_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% plot()
Paid_HH_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict()
Paid_HH_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict() %>% plot()


##case data for House business and Small claim size
Case_HH_sml <- dt_PaidCase %>% filter(Business == "House", 
                                      ClaimSize == "Small", 
                                      dataset_type == "CASE")
Case_HH_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount")
Case_HH_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% ata()
Case_HH_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% plot()
Case_HH_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict()
Case_HH_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict() %>% plot()


##case data for House business and Large claim size
Case_HH_lrg <- dt_PaidCase %>% filter(Business == "House", 
                                      ClaimSize == "Large", 
                                      dataset_type == "CASE")
summary(Case_HH_lrg)
Case_HH_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount")
Case_HH_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% ata()
Case_HH_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% plot()
##Case_HH_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict()
##Case_HH_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict() %>% plot()


##paid data for 3rd Party business and Small claim size
Paid_3P_sml <- dt_PaidCase %>% filter(Business == "3rd Party", 
                                      ClaimSize == "Small", 
                                      dataset_type == "PAID")
Paid_3P_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount")
Paid_3P_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% ata()
Paid_3P_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% plot()
Paid_3P_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict()
Paid_3P_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict() %>% plot()

##paid data for 3rd Party business and Large claim size
Paid_3P_lrg <- dt_PaidCase %>% filter(Business == "3rd Party", 
                                      ClaimSize == "Large", 
                                      dataset_type == "PAID")
Paid_3P_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount")
Paid_3P_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% ata()
Paid_3P_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% plot()
Paid_3P_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict()
Paid_3P_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict() %>% plot()

##case data for 3rd Party business and Small claim size
Case_3P_sml <- dt_PaidCase %>% filter(Business == "3rd Party", 
                                      ClaimSize == "Small", 
                                      dataset_type == "CASE")
Case_3P_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount")
Case_3P_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% ata()
Case_3P_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% plot()
Case_3P_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict()
Case_3P_sml %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict() %>% plot()

##case data for 3rd Party business and Large claim size
Case_3P_lrg <- dt_PaidCase %>% filter(Business == "3rd Party", 
                                      ClaimSize == "Large", 
                                      dataset_type == "CASE")
Case_3P_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount")
Case_3P_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% ata()
Case_3P_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% plot()
Case_3P_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict()
Case_3P_lrg %>% as.triangle(origin = "ay", dev="dy", "SumOfamount") %>% chainladder() %>% predict() %>% plot()

##kedze CASE su rezervy tak hodnoty klesaju
##v pripade velkych skod 3rd Party dochadza k vyznamnejsim vyplatam v 3-4 vyvojovom roku
##v pripade velkych rezerv v House nie je mozne odhadnut vyvoj pomocou predict, mozno kvoli tomu ze sa rezervy rychlo rozpustia

## Najvacsi rozdiel je v pohlade Business,
##v pripade House (skody na majetku) ide o short tail,v prvych 2-3 vyvojovych rokoch skody rastu prudko a nasledne sa ustalia, zmeny v posledych rokoch nie su vyrazne
##v pripade 3rd Party (skody na zdravi) ide o long tail, skody sustavne rastu a ustalia sa az v poslednych rokoch
## tento rozdiel vznika, pretoze skody na majetku su indetifikovane pri vzniku a vyriesene v kratkom case,
## skody na zdravi sa mozu objavit aj niekolko rokov po vzniku, pripadne liecba moze trvat roky

