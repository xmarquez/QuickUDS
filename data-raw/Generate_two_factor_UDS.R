# Generate two-factor UDS
library(dplyr)
library(QuickUDS)


indexes <- c("arat_pmm","blm","bmr_democracy","bnr","bollen_pmm","doorenspleet","eiu","freedomhouse",
             "freedomhouse_electoral","gwf","hadenius_pmm","kailitz_tri","lied_accountable","lied_electoral","lied_inclusive","mainwaring","magaloni_regime_tri",
             "munck_pmm","pacl","PEPS1v","pitf",
             "exrec","exconst","polcomp","polyarchy_contestation","prc_notrans","svolik","ulfelder",
             "v2x_polyarchy","vanhanen_participation","vanhanen_competition","wahman_teorell_hadenius")

data <- democracy[ ,c("country_name","GWn","cown","year","region","continent","microstate","lat","lon","in_system",indexes)] %>% mutate_each(funs(rm_special = ifelse(. < -10,NA,.)), c(exrec,exconst,polcomp))

data <- left_join(data,PoliticalDatasets::vdem %>% select(country_name,GWn,year,v2x_partip,v2x_partipdem,v2x_egaldem,v2x_egal) %>% distinct(country_name,GWn,year))

data <- reshape2::melt(data, measure.vars = c(indexes,"v2x_partip","v2x_partipdem","v2x_egaldem","v2x_egal"), na.rm = TRUE)
data <- data %>% group_by(country_name,year) %>% mutate(measures_per_cy = n()) %>% ungroup()
data <- reshape2::dcast(data, ... ~ variable)
data <- data %>% arrange(country_name,year)


data2 <- prepare_data(data)

model <- mirt::mirt(data2[, c(indexes,"v2x_partip","v2x_partipdem","v2x_egaldem","v2x_egal")], model = 2, itemtype = "graded", SE = TRUE, verbose=TRUE, technical = list(NCYCLES = 1000))

scores <- mirt::fscores(model, full.scores = TRUE, full.scores.SE = TRUE)
scores <- as.data.frame(scores) %>%
  dplyr::rename(cont = F1, se.cont = SE_F1, part = F2, se.part = SE_F2) %>%
  mutate(cont = -cont, part = -part,
         pct975.cont = cont + 1.96 * se.cont, pct025.cont = cont - 1.96 * se.cont,
         pct975.part = part + 1.96 * se.part, pct025.part = part - 1.96 * se.part)

extended_uds_2factor <- bind_cols(data,scores)

devtools::use_data(extended_uds_2factor, overwrite=TRUE)

# library(ggplot2)
#
# ggplot(data= extended_uds_2factor, aes(x=cont,y=part)) + geom_point(alpha=0.2,position="jitter")
#
# data1 <- left_join(PoliticalDatasets::kailitz_yearly %>% select(country_name,year,GWn,kailitz_binary:transition),extended_uds_2factor)
#
# library(ggalt)
# ggplot(data = data1,aes(x=cont,y=part,color=communist)) + geom_point(alpha=0.2,position="jitter") + geom_density2d()
#
# data1 <- extended_uds_2factor %>% filter(country_name == "Russia (Soviet Union)")
#
# ggplot(data = extended_uds_2factor %>% filter(country_name == "Russia (Soviet Union)"),aes(x=cont,y=part,color=year)) + geom_point() + geom_path() + geom_text(aes(label = year))
#
# ggplot(data = extended_uds_2factor %>% filter(country_name == "United States of America"),aes(x=cont,y=part,color=year)) + geom_point() + geom_path() + geom_text(aes(label = year))
#
# ggplot(data = extended_uds_2factor %>% filter(country_name == "Chile"),aes(x=cont,y=part,color=year)) + geom_point() + geom_path() + geom_text(aes(label = year))
#
# ggplot(data = extended_uds_2factor %>% filter(country_name == "United States of America", year > 1900),aes(x=year)) +
#   geom_path(aes(y = cont)) +
#   geom_ribbon(aes(ymin = pct025.cont,ymax = pct975.cont),alpha=0.2, fill = "red") +
#   geom_path(aes(y = part)) +
#   geom_ribbon(aes(ymin = pct025.part,ymax = pct975.part),alpha=0.2, fill = "blue")
#
# ggplot(data = extended_uds_2factor %>% filter(country_name == "Russia (Soviet Union)", year > 1900),aes(x=year)) +
#   geom_path(aes(y = cont)) +
#   geom_ribbon(aes(ymin = pct025.cont,ymax = pct975.cont),alpha=0.2, fill = "red") +
#   geom_path(aes(y = part)) +
#   geom_ribbon(aes(ymin = pct025.part,ymax = pct975.part),alpha=0.2, fill = "blue")
#
# ggplot(data = extended_uds_2factor %>% filter(country_name == "Spain", year > 1900),aes(x=year)) +
#   geom_path(aes(y = cont)) +
#   geom_ribbon(aes(ymin = pct025.cont,ymax = pct975.cont),alpha=0.2, fill = "red") +
#   geom_path(aes(y = part)) +
#   geom_ribbon(aes(ymin = pct025.part,ymax = pct975.part),alpha=0.2, fill = "blue")
#
# ggplot(data = extended_uds_2factor %>% filter(country_name == "Saudi Arabia", year > 1900),aes(x=year)) +
#   geom_path(aes(y = cont)) +
#   geom_ribbon(aes(ymin = pct025.cont,ymax = pct975.cont),alpha=0.2, fill = "red") +
#   geom_path(aes(y = part)) +
#   geom_ribbon(aes(ymin = pct025.part,ymax = pct975.part),alpha=0.2, fill = "blue")
#
