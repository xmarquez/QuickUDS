# Generate Extended UDS
library(dplyr)
library(QuickUDS)

indexes <- c("arat_pmm","blm","bmr_democracy","bnr","bollen_pmm","doorenspleet","eiu","freedomhouse",
             "freedomhouse_electoral","gwf","hadenius_pmm","kailitz_tri","lied","mainwaring","magaloni_regime_tri",
             "munck_pmm","pacl","PEPS1v","pitf",
             "polity2","polyarchy_contestation","prc_notrans","svolik","ulfelder","utip_dichotomous_strict",
             "v2x_polyarchy","vanhanen_democratization","wahman_teorell_hadenius")

data <- QuickUDS::democracy[ ,c("country_name","GWn","cown","year","region","continent","microstate","lat","lon","in_system",indexes)]
data <- reshape2::melt(data, measure.vars = indexes, na.rm = TRUE)
data <- data %>% group_by(country_name,year) %>% mutate(measures_per_cy = n()) %>% ungroup()
data <- reshape2::dcast(data, ... ~ variable)
data <- data %>% arrange(country_name,year)

data2 <- prepare_democracy(indexes)

extended_model <- democracy_model(data2,indexes, verbose=TRUE, technical = list(NCYCLES = 2500))
extended_scores <- democracy_scores(extended_model)
extended_uds <- bind_cols(data,extended_scores)
rm(data2,data,indexes,extended_scores)

extended_uds <- match_to_uds(extended_uds)

extended_uds <- extended_uds %>% group_by(country_name) %>% mutate(group1 = PoliticalDatasets::count_sequence_breaks(year), group2 = PoliticalDatasets::count_sequence_breaks(in_system,seq_step = 0), group3 = paste(group1,group2))

extended_uds <- extended_uds %>% ungroup() %>% arrange(country_name,GWn)

extended_uds <- extended_uds %>% mutate(adj.index = pnorm(adj.z1), adj.index.pct025 = pnorm(adj.pct025), adj.index.pct975 = pnorm(adj.pct975))

devtools::use_data(extended_uds, overwrite=TRUE)

# Quick visual test
# ggplot(data=extended_uds %>% filter(in_system | year < 1816, country_name %in% sample(unique(extended_uds$country_name),10)), aes(x=year,y=adj.z1,ymin=adj.pct025,max=adj.pct975,group=group3)) + geom_path()+geom_ribbon(alpha=0.2) + facet_wrap(~country_name) + geom_hline(yintercept=0,color="red")
#
# ggplot(data=extended_uds %>% filter(in_system | year < 1816,country_name == "Russia (Soviet Union)"), aes(x=year,y=adj.z1,ymin=adj.pct025,max=adj.pct975,group=group3)) + geom_path()+geom_ribbon(alpha=0.2) + facet_wrap(~country_name) + geom_hline(yintercept=0,color="red")

# ggplot(data=extended_uds %>% filter(in_system | year < 1816, country_name %in% sample(unique(extended_uds$country_name),10)), aes(x=year,y=adj.index,ymin=adj.index.pct025,max=adj.index.pct975,group=group3)) + geom_path()+geom_ribbon(alpha=0.2) + facet_wrap(~country_name)
