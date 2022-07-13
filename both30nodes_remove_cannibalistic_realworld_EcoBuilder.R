rm(list=ls())
getwd()
setwd('C:/data')
library(dplyr)
load('EcoBuildersummary30nodes.RData')

setwd('C:/data/Hsi')
load('remove_cannibalistic_Empiwebs_30nodes.RData')

EcoBuilder <- rbind(level1_summary,level2_summary,level3_summary)

rep_webs <- rep_webs[,c(-2,-7,-9,-14,-15,-16,-17,-18,-24,-25)]


rep_webs <- rep_webs[,c(1,2,3,5,4,6,7,8,9,10,11,12,13,14,15,16,22,17,18,19,20,21)]


EcoBuilder$linkage.density <- EcoBuilder$num.link/EcoBuilder$num.sp
EcoBuilder$directed.connectance <- EcoBuilder$linkage.density/(EcoBuilder$num.sp-1)

rep_webs$linkage.density <- rep_webs$num.link/rep_webs$num.sp
rep_webs$directed.connectance <- rep_webs$linkage.density/(rep_webs$num.sp-1)

write.csv(EcoBuilder,file = 'remove_cannibalistic_EcoBuilder.csv')
write.csv(rep_webs,file='remove_cannibalistic_realworld.csv')

save(EcoBuilder,rep_webs,file = 'remove_cannibalistic_realworld_EcoBuilder_both30nodes.RData')
