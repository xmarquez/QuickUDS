library(PoliticalDatasets)

original_pmm_democracy_data_1946_2008 <- PoliticalDatasets::original.pmm.democracy.data.1946.2008
democracy <- PoliticalDatasets::democracy
democracy_long <- PoliticalDatasets::democracy_long
uds_2014 <- PoliticalDatasets::uds
uds_2010 <- PoliticalDatasets::uds_original
uds_2011 <- PoliticalDatasets::uds_2008

uds_2014$version <- "PMM2014"
uds_2011$version <- "PMM2011"
uds_2010$version <- "PMM2010"

dat <- reshape2::melt(democracy %>% filter(paste(country_name,year) %in% paste(uds_2010$country_name,uds_2010$year)), measure.vars = c("arat_pmm","blm_pmm","bollen_pmm","freedomhouse_pmm","mainwaring_pmm","pacl_pmm","polity_pmm","polyarchy_pmm","prc_pmm","vanhanen_pmm"),na.rm=TRUE)
dat <- dat %>% group_by(country_name,year) %>% mutate(num_measures = n())
dat <- reshape2::dcast(dat, ... ~ variable)
dat <- dat %>% arrange(country_name,year)
dat <- dat %>% dplyr::select_(.dots=c("country_name","year","num_measures","arat_pmm","blm_pmm","bollen_pmm","freedomhouse_pmm","mainwaring_pmm","pacl_pmm","polity_pmm","polyarchy_pmm","prc_pmm","vanhanen_pmm"))

uds_2010 <- left_join(uds_2010,dat)

dat <- reshape2::melt(democracy %>% filter(paste(country_name,year) %in% paste(uds_2011$country_name,uds_2011$year)), measure.vars = c("arat_pmm","blm_pmm","bollen_pmm","freedomhouse_pmm","hadenius_pmm","mainwaring_pmm","munck_pmm","pacl_pmm","polity_pmm","polyarchy_pmm","prc_pmm","vanhanen_pmm"),na.rm=TRUE)
dat <- dat %>% group_by(country_name,year) %>% mutate(num_measures = n())
dat <- reshape2::dcast(dat, ... ~ variable)
dat <- dat %>% arrange(country_name,year)
dat <- dat %>% dplyr::select_(.dots=c("country_name","year","num_measures","arat_pmm","blm_pmm","bollen_pmm","freedomhouse_pmm","hadenius_pmm","mainwaring_pmm","munck_pmm","pacl_pmm","polity_pmm","polyarchy_pmm","prc_pmm","vanhanen_pmm"))

uds_2011 <- left_join(uds_2011,dat)

dat <- reshape2::melt(democracy %>% filter(paste(country_name,year) %in% paste(uds_2014$country_name,uds_2014$year)), measure.vars = c("arat_pmm","blm_pmm","bollen_pmm","freedomhouse","hadenius_pmm","mainwaring_pmm","munck_pmm","pacl_pmm","polity2","polyarchy_pmm","prc_pmm","vanhanen_pmm","eiu"),na.rm=TRUE)
dat <- dat %>% group_by(country_name,year) %>% mutate(num_measures = n())
dat <- reshape2::dcast(dat, ... ~ variable)
dat <- dat %>% arrange(country_name,year)
dat <- dat %>% dplyr::select_(.dots=c("country_name","year","num_measures","arat_pmm","blm_pmm","bollen_pmm","freedomhouse","hadenius_pmm","mainwaring_pmm","munck_pmm","pacl_pmm","polity2","polyarchy_pmm","prc_pmm","vanhanen_pmm","eiu"))

uds_2014 <- left_join(uds_2014,dat)

rm(dat)

detach(package:PoliticalDatasets)

devtools::use_data(original_pmm_democracy_data_1946_2008, overwrite = TRUE)
devtools::use_data(democracy, overwrite = TRUE)
devtools::use_data(democracy_long, overwrite = TRUE)
devtools::use_data(uds_2014, overwrite = TRUE)
devtools::use_data(uds_2011, overwrite = TRUE)
devtools::use_data(uds_2010, overwrite = TRUE)
