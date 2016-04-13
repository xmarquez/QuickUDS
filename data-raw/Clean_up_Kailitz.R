library(dplyr)
library(PoliticalDatasets)
library(jsonlite)

kailitz <- fromJSON("../Data/Kailitz data.json", flatten = TRUE, simplifyDataFrame =TRUE)

data <- data.frame()
for(i in names(kailitz)) {
  d <- plyr::ldply(kailitz[[i]])
  d$regime <- i
  data <- rbind(data, d)
}

kailitz <- data
rm(data,d,i)

kailitz <- kailitz %>% rename(kailitz_country = .id) %>% mutate(startdate = ymd(paste0(start,"-1-1")), enddate = ymd(paste0(end,"-12-31"))) %>% arrange(kailitz_country,startdate,enddate)

kailitz <- distinct(kailitz)

kailitz <- PoliticalDatasets::to_gw_system(kailitz, country_col = "kailitz_country", date_col = c("startdate","enddate"), grouping_var = "regime")

kailitz <- kailitz %>% filter(country_name != "Germany (Prussia)")

detach(package:jsonlite)
# Testing
# anti_join(k,kailitz)
# anti_join(kailitz,k)
# kailitz %>% group_by(kailitz_country, country_name, GWn) %>% summarise(min(start),max(end)) %>% data.frame()
# kailitz %>% group_by(kailitz_country, country_name, GWn) %>% filter(kailitz_country != country_name) %>% summarise(min(start),max(end)) %>% data.frame()
# kailitz %>% group_by(kailitz_country, country_name, GWn) %>% filter(!in_system) %>% summarise(min(start),max(end)) %>% data.frame()
# kailitz %>% group_by(country_name,start) %>% filter(n() > 1) %>% select(country_name, start, end, regime) %>% arrange(country_name) %>% data.frame()
# kailitz %>% group_by(country_name,end) %>% filter(n() > 1) %>% select(country_name, start, end, regime) %>% arrange(country_name) %>% data.frame()

kailitz <- kailitz %>% group_by(country_name) %>% mutate(period = seq_along(country_name))
kailitz.yearly <- kailitz %>% group_by(country_name,GWn,period,regime,start,end) %>% do(data.frame(year = .$start:.$end))
kailitz.yearly <- kailitz.yearly %>% ungroup() %>% arrange(country_name,year,regime) %>% distinct(country_name,year,regime)

kailitz.yearly <- kailitz.yearly %>% group_by(country_name,year) %>% mutate(combined_regime = paste(regime,collapse = "-"))
kailitz.yearly <- kailitz.yearly %>% mutate(kailitz_binary = ifelse(regime == "Liberal Democracy", 1, 0),
                                            kailitz_tri = ifelse(regime == "Liberal Democracy",2,
                                                                 ifelse(regime == "Electoral Autocracy",1,0)))

kailitz.yearly <- kailitz.yearly %>%
  group_by(country_name,year,GWn) %>%
  summarise(combined_regime = unique(combined_regime),
            kailitz_binary = min(kailitz_binary),
            kailitz_tri = min(kailitz_tri)) %>%
  ungroup()

countries <- kailitz.yearly %>% select(country_name,year,GWn) %>% distinct() %>% rename(kailitz_country = country_name)

countries <- to_gw_system(countries, country_col = "kailitz_country", code_col = "GWn",code_type = "GWn")

kailitz.yearly <- left_join(countries,kailitz.yearly)

rm(countries)

kailitz.yearly <- kailitz.yearly %>%
  mutate(personal = grepl("Personalist",combined_regime),
         communist = grepl("Communist",combined_regime),
         military = grepl("Military",combined_regime),
         party = grepl("One party",combined_regime),
         monarchy = grepl("Monarchy",combined_regime),
         electoral = grepl("Electoral",combined_regime),
         failure = grepl("Failure",combined_regime),
         transition = grepl("Transition",combined_regime))

kailitz <- kailitz %>% select(-period,-startdate,-enddate)

devtools::use_data(kailitz, overwrite = TRUE)
devtools::use_data(kailitz.yearly, overwrite = TRUE)
