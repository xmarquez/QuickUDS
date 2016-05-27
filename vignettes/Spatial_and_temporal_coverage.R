## ---- include=FALSE------------------------------------------------------
library(knitr)
library(QuickUDS)
library(dplyr)
library(ggplot2)
library(GGally)
opts_chunk$set(echo=TRUE)
options(knitr.table.format = 'markdown')


## ----general_characteristics---------------------------------------------
library(knitr)
library(QuickUDS)
library(dplyr)
library(reshape2)

democracy_long <- democracy %>%
        melt(id.vars = 1:15, na.rm=TRUE) 

kable(democracy_long %>%
        group_by(variable) %>%
        summarise(distinct_countries = n_distinct(country_name),
                  distinct_years = n_distinct(year),
                  min_year = min(year),
                  max_year = max(year),
                  mean_year = mean(year),
                  num_values = n_distinct(value),
                  mean = mean(value),
                  median = median(value),
                  min_value = min(value),
                  max_value = max(value),
                  sd = sd(value)),
      digits = 2)


## ----arat_coverage, fig.width=7,fig.height=7-----------------------------

library(ggplot2)

panel <- democracy %>% select(country_name,year) %>% distinct()

temporal_coverage <- function(data) {
  data <- left_join(panel,data) 
  
  data <- data %>% 
    group_by(year, add=TRUE) %>% 
    count(year,in_system)

  ggplot(data =  data, aes(x=year,fill = in_system, y = n)) + 
    geom_bar(stat = "identity") +
    theme_bw() +
    theme(legend.position = "bottom") +
    labs(fill = "In G&W system of states", 
         y = "Number of states or territories included\nin each year of `democracy` panel") +
    ggtitle("Coverage \nwithin the `democracy` dataset")
}

library(rworldmap)

world <- getMap()
world <- fortify(world)

spatial_coverage <- function(data) {
  ggplot() +
    geom_path(data = world, aes(x=long,y=lat,group=group)) +
    theme_bw() +
    theme(legend.position = "bottom") +
    geom_count(data = data, aes(x=lon,y=lat,color = in_system)) +
    labs(color = "In G&W system of states", y = "", x = "", size = "Number of country-years") +
    ggtitle("Spatial coverage")
}

data <- democracy_long %>% 
  filter(variable == "arat_pmm")

temporal_coverage(data)

spatial_coverage(data)

## ----arat_distribution---------------------------------------------------
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)

ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)


## ----blm_coverage, fig.width=7,fig.height=7------------------------------

data <- democracy_long %>% filter(variable == "blm")

temporal_coverage(data)

spatial_coverage(data)

## ----blm_distribution----------------------------------------------------
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----bmr_coverage, fig.width=7,fig.height=7------------------------------

data <- democracy_long %>% filter(variable == "bmr_democracy")

temporal_coverage(data)

spatial_coverage(data)

## ----bmr_distribution----------------------------------------------------
data <- democracy_long %>% filter(variable %in% c("bmr_democracy","bmr_democracy_omitteddata"))

ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----bnr_coverage, fig.width=7,fig.height=7------------------------------

data <- democracy_long %>% filter(variable == "bnr")

temporal_coverage(data)

spatial_coverage(data)

## ----bnr_distribution----------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----bollen_coverage, fig.width=7,fig.height=7---------------------------

data <- democracy_long %>% filter(variable == "bollen_pmm")

temporal_coverage(data)

spatial_coverage(data)

## ----bollen_distribution-------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)

ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)


## ----doorenspleet_coverage, fig.width=7,fig.height=7---------------------

data <- democracy_long %>% filter(variable == "doorenspleet")

temporal_coverage(data)

spatial_coverage(data)

## ----doorenspleet_distribution-------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----eiu_coverage, fig.width=7,fig.height=7------------------------------

data <- democracy_long %>% filter(variable == "eiu")

temporal_coverage(data)

spatial_coverage(data)

## ----eiu_distribution----------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)

ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)

## ----fh_coverage, fig.width=7,fig.height=7-------------------------------

data <- democracy_long %>% filter(variable %in% c("freedomhouse"))

temporal_coverage(data)

spatial_coverage(data)

## ----fh_distribution-----------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)

ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)


## ----fh_electoral_coverage, fig.width=7,fig.height=7---------------------

data <- democracy_long %>% filter(variable == "freedomhouse_electoral")

temporal_coverage(data)

spatial_coverage(data)

## ----fh_electoral_distribution-------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----gwf_coverage, fig.width=7,fig.height=7------------------------------

data <- democracy_long %>% filter(variable == "gwf")

temporal_coverage(data) +
  geom_vline(xintercept = 1945) +
  annotate("text", label = "Limit of original dataset", x = 1945,y = 100, angle=90)

spatial_coverage(data)

## ----gwf_distribution----------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----hadenius_coverage, fig.width=7,fig.height=7-------------------------
data <- democracy_long %>% filter(variable == "hadenius_pmm")

temporal_coverage(data) 

spatial_coverage(data)


## ----hadenius_distribution-----------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)

ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)
  

## ----kailitz_coverage, fig.width=7,fig.height=7--------------------------

data <- democracy_long %>% filter(variable == "kailitz_binary")

temporal_coverage(data)

spatial_coverage(data)


## ----kailitz_distribution------------------------------------------------

data <- democracy_long %>% filter(variable %in% c("kailitz_binary","kailitz_tri"))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----kailitz_classification_problems_1-----------------------------------
kable(kailitz.yearly %>% 
        count(multiple_regimes = grepl("-",combined_regime)))

kable(kailitz.yearly %>% 
        filter(grepl("-",combined_regime)) %>%
        group_by(country_name) %>%
        arrange(country_name,year) %>%
        group_by(combined_regime, add=TRUE) %>%
        summarise(min = min(year), max = max(year), n = n()))


## ----kailitz_classification_problems_2-----------------------------------
kable(kailitz.yearly %>% 
        filter(grepl("-",combined_regime)) %>%
        group_by(country_name) %>%
        arrange(country_name,year) %>%
        group_by(combined_regime, add=TRUE) %>%
        summarise(min = min(year), max = max(year), n = n()) %>%
        filter(grepl("democracy",combined_regime, ignore.case=TRUE)))

## ----kailitz_index_count-------------------------------------------------
kable(kailitz.yearly %>%
        count(kailitz_binary,kailitz_tri,combined_regime))

## ----lied_coverage, fig.width=7,fig.height=7-----------------------------

data <- democracy_long %>% filter(variable == "lied")

temporal_coverage(data)

spatial_coverage(data)

## ----lied_distribution---------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value),binwidth=1) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----magaloni_extended_coverage, fig.width=7,fig.height=7----------------
data <- democracy_long %>% filter(variable == "magaloni_democ_binary")

temporal_coverage(data) +
  geom_vline(xintercept = 1950) +
  annotate("text", label = "Limit of original dataset", x = 1950,y = 100, angle=90)

spatial_coverage(data)


## ----magaloni_distribution-----------------------------------------------

data <- democracy_long %>% filter(variable %in% c("magaloni_democ_binary","magaloni_regime_tri"))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
  

## ----mainwaring_coverage, fig.width=7,fig.height=7-----------------------

data <- democracy_long %>% filter(variable == "mainwaring")

temporal_coverage(data) 

spatial_coverage(data)


## ----mainwaring_distribution---------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----munck_coverage, fig.width=7,fig.height=7----------------------------

data <- democracy_long %>% filter(variable == "munck_pmm")

temporal_coverage(data) 

spatial_coverage(data)


## ----munck_distribution--------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)

ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)

## ----pacl_coverage, fig.width=7,fig.height=7-----------------------------

data <- democracy_long %>% filter(variable == "pacl")

temporal_coverage(data) 

spatial_coverage(data)


## ----pacl_distribution---------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years", x="") +
  facet_wrap(~variable, ncol=2) 


## ----peps_coverage, fig.width=7,fig.height=7-----------------------------
data <- democracy_long %>% filter(variable %in% c("PEPS1i","PEPS2i","PEPS1q","PEPS2q","PEPS1v","PEPS2v","Polity3"))

data <- left_join(panel,data) 
  
data <- data %>% group_by(variable,year, add=TRUE) %>% count_(vars = c("year","in_system","variable"))

ggplot(data =  data, aes(x=year,fill = in_system, y = n)) + 
    geom_bar(stat = "identity") +
    theme_bw() +
    theme(legend.position = "bottom") +
    labs(fill = "In G&W system of states", y = "Number of states or territories\nin each year of `democracy` panel") +
    ggtitle("Temporal coverage \nwithin the `democracy` dataset") + 
  facet_wrap(~variable) 

data <- democracy_long %>% filter(variable %in% c("PEPS1i","PEPS2i","PEPS1q","PEPS2q","PEPS1v","PEPS2v"))

spatial_coverage(data)

## ----peps_distribution, fig.width= 5,fig.height=5------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value),binwidth=1) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years", x="") +
  facet_wrap(~variable, ncol=2)

library(GGally)
ggcorr(data = democracy %>% select(PEPS1i:PEPS2v), label=TRUE,label_round=3) + scale_fill_gradient2(midpoint = 0.7)


## ----peps_problems-------------------------------------------------------
kable(democracy %>%
        filter(Polity3 != polity2) %>%
        group_by(country_name,Polity3,polity2,polity) %>%
        summarise(years = min(year), max = max(year), n = n()))


## ----pitf_coverage, fig.width=7,fig.height=7-----------------------------

data <- democracy_long %>% filter(variable == "pitf")

temporal_coverage(data) 

spatial_coverage(data)


## ----pitf_distribution---------------------------------------------------

ggplot(data = data) +
  geom_bar(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years", x="") +
  facet_wrap(~variable, ncol=2) 

data <- democracy_long %>% filter(variable == "pitf_binary")

ggplot(data = data) +
  geom_bar(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years", x="") +
  facet_wrap(~variable, ncol=2) 


## ----polity_coverage, fig.width=7,fig.height=7---------------------------

data <- democracy_long %>% filter(variable == "polity")

temporal_coverage(data) 

spatial_coverage(data)

## ----polity_distribution-------------------------------------------------

data <- democracy_long %>% filter(variable == "polity2")

ggplot(data = data) +
  geom_histogram(aes(x=value),binwidth=1) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----polyarchy_coverage, fig.width=7,fig.height=7------------------------

data <- democracy_long %>% filter(variable == "polyarchy_reversed")

temporal_coverage(data) 

spatial_coverage(data)


## ----polyarchy_distribution----------------------------------------------

data <- democracy_long %>% filter(variable %in% c("polyarchy_reversed","polyarchy_contestation"))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)

kable(democracy %>% 
        filter(!is.na(polyarchy_reversed)) %>% 
        count(polyarchy_reversed,polyarchy_contestation),
      caption = "Relationship between reversed polyarchy measure and polyarchy contestation measure")


## ----prc_coverage, fig.width=7,fig.height=7------------------------------

data <- democracy_long %>% filter(variable == "prc")

temporal_coverage(data) 

spatial_coverage(data)

## ----prc_distribution----------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----pipe_coverage, fig.width=7,fig.height=7-----------------------------

data <- democracy_long %>% filter(variable == "przeworski")

temporal_coverage(data) 

spatial_coverage(data)


## ----pipe_distribution---------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----svolik_coverage, fig.width=7,fig.height=7---------------------------
data <- democracy_long %>% filter(variable == "svolik")

temporal_coverage(data) +
  geom_vline(xintercept = 1946) +
  annotate("text", label = "Limit of original dataset", x = 1946,y = 100, angle=90)

spatial_coverage(data)


## ----svolik_distribution-------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
  

## ----ulfelder_coverage, fig.width=7,fig.height=7-------------------------
data <- democracy_long %>% filter(variable == "ulfelder")

temporal_coverage(data) 

spatial_coverage(data)


## ----ulfelder_distribution-----------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
  

## ----utip_coverage, fig.width=7,fig.height=7-----------------------------
data <- democracy_long %>% filter(variable == "utip_dichotomous")

temporal_coverage(data) 

spatial_coverage(data)


## ----utip_distribution---------------------------------------------------

data <- democracy_long %>% filter(variable %in% c("utip_dichotomous_strict","utip_dichotomous","utip_trichotomous"))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
  

## ----vanhanen_coverage, fig.width=7,fig.height=7-------------------------
data <- democracy_long %>% filter(variable == "vanhanen_democratization")

temporal_coverage(data) 

spatial_coverage(data)


## ----vanhanen_distribution-----------------------------------------------

data <- democracy_long %>% filter(variable %in% c("vanhanen_democratization","vanhanen_participation","vanhanen_competition"))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)

ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)  

## ----vdem_coverage, fig.width=7,fig.height=7-----------------------------
data <- democracy_long %>% filter(variable == "v2x_polyarchy")

temporal_coverage(data) 

spatial_coverage(data)


## ----vdem_distribution, fig.width= 5,fig.height=5------------------------

data <- democracy_long %>% filter(grepl("v2x",variable))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)

ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)  

ggcorr(data = democracy %>% select(v2x_api:v2x_polyarchy), label=TRUE,label_round=3, hjust=1) + scale_fill_gradient2(midpoint = 0.7)


## ----wahman_coverage, fig.width=7,fig.height=7---------------------------

data <- democracy_long %>% filter(variable == "wahman_teorell_hadenius")

temporal_coverage(data) 

spatial_coverage(data)


## ----wahman_distribution-------------------------------------------------

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)


## ----code_differences----------------------------------------------------
count_sequence_breaks <- function(seq, seq_step = 1) {
  first_diff <- c(seq_step, diff(seq)) - seq_step
  periods <- cumsum(abs(first_diff))
  periods
}

kable(democracy %>%
        filter(GWn != cown | GWn != polity_ccode | cown != polity_ccode) %>%
        distinct(country_name,GWn,cown,polity_ccode,year) %>%
        arrange(country_name,GWn,cown,polity_ccode,year) %>% 
        group_by(country_name,GWn,cown,polity_ccode) %>%
        mutate(period = count_sequence_breaks(year)) %>%
        group_by(period, add = TRUE) %>%
        summarise(min = min(year), max = max(year), n = n()),
      caption = "Differences between Gleditsch and Ward codes, COW codes, and Polity codes")

## ----cow_system_differences----------------------------------------------

COW_system <- read.csv("http://www.correlatesofwar.org/data-sets/state-system-membership/system2011/at_download/file")

COW_system <- COW_system %>% rename(cown = ccode)

kable(anti_join(COW_system,democracy))

## ----cow_system_duplicates-----------------------------------------------
kable(democracy %>% 
        group_by(country_name,year) %>% 
        filter(n() > 1) %>% 
        group_by(country_name) %>% 
        summarise(countries = paste(unique(country_name),collapse = ", "), min(year), max(year)))

kable(democracy %>% 
        group_by(GWn,year) %>% 
        filter(n() > 1) %>% 
        group_by(GWn) %>% 
        summarise(countries = paste(unique(country_name),collapse = ", "), min(year), max(year)))

kable(democracy %>% 
        group_by(polity_ccode,year) %>% 
        filter(n() > 1) %>% 
        group_by(polity_ccode) %>% 
        summarise(countries = paste(unique(country_name),collapse = ", "), min(year), max(year)))

kable(democracy %>% 
        group_by(cown,year) %>% 
        filter(n() > 1) %>% 
        group_by(cown) %>% 
        summarise(countries = paste(unique(country_name),collapse = ", "), min(year), max(year)))

