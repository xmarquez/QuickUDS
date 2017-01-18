library(dplyr)
library(PoliticalDatasets)
library(jsonlite)
library(lubridate)

kailitz <- fromJSON("../Data/Kailitz data.json", flatten = TRUE, simplifyDataFrame =TRUE)

data <- data.frame()
for(i in names(kailitz)) {
  d <- plyr::ldply(kailitz[[i]])
  d$regime <- i
  data <- rbind(data, d)
}

kailitz <- data
rm(data, d, i)

kailitz <- kailitz %>%
  rename(kailitz_country = .id) %>%
  mutate(startdate = ymd(paste0(start,"-1-1")),
         enddate = ymd(paste0(end,"-12-31"))) %>%
  arrange(kailitz_country,startdate,enddate) %>%
  distinct()

kailitz <- PoliticalDatasets::to_gw_system(kailitz,
                                           country_col = "kailitz_country",
                                           date_col = c("startdate", "enddate"),
                                           grouping_var = "regime")

kailitz <- kailitz %>% filter(country_name != "Germany (Prussia)")

detach(package:jsonlite)

kailitz <- kailitz %>%
  group_by(country_name) %>%
  mutate(period = seq_along(country_name))

library(tidyr)

kailitz_yearly <- kailitz %>%
  group_by(country_name, GWn, period, regime, start, end) %>%
  mutate(year = list(start:end)) %>%
  unnest() %>%
  ungroup() %>%
  arrange(country_name, year, regime) %>%
  distinct(country_name, year, regime, .keep_all = TRUE) %>%
  group_by(country_name,year) %>%
  mutate(combined_regime = paste(regime,collapse = "-")) %>%
  mutate(kailitz_binary = ifelse(regime == "Liberal Democracy", 1, 0),
         kailitz_tri = ifelse(regime == "Liberal Democracy", 2,
                              ifelse(regime == "Electoral Autocracy", 1, 0))) %>%
  group_by(country_name, year, GWn) %>%
  summarise(combined_regime = unique(combined_regime),
            kailitz_binary = min(kailitz_binary),
            kailitz_tri = min(kailitz_tri)) %>%
  ungroup()

countries <- kailitz_yearly %>%
  select(country_name,year,GWn) %>%
  distinct() %>%
  rename(kailitz_country = country_name)

countries <- PoliticalDatasets::to_gw_system(countries,
                          country_col = "kailitz_country",
                          code_col = "GWn",
                          code_type = "GWn")

kailitz_yearly <- left_join(countries, kailitz_yearly)

rm(countries)

kailitz_yearly <- kailitz_yearly %>%
  mutate(personal = grepl("Personalist", combined_regime),
         communist = grepl("Communist", combined_regime),
         military = grepl("Military", combined_regime),
         party = grepl("One party", combined_regime),
         monarchy = grepl("Monarchy", combined_regime),
         electoral = grepl("Electoral", combined_regime),
         failure = grepl("Failure", combined_regime),
         transition = grepl("Transition",combined_regime))

kailitz <- kailitz %>% select(-period, -startdate, -enddate)

devtools::use_data(kailitz, overwrite = TRUE)
devtools::use_data(kailitz_yearly, overwrite = TRUE)
