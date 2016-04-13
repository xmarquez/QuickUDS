## ---- include=FALSE------------------------------------------------------
library(knitr)
library(QuickUDS)
library(dplyr)
opts_chunk$set(echo=TRUE)
options(knitr.table.format = 'html')

## ----fh_pmm_comparison_setup---------------------------------------------
library(QuickUDS)
library(dplyr)
comparison <- democracy %>% 
  select(country_name,GWn,year,freedomhouse,freedomhouse_pmm) %>% 
  filter(year >= 1946, year <= 2008)

## ----fh_pmm_comparison_1981_1972-----------------------------------------

kable(comparison %>% 
        filter((!is.na(freedomhouse_pmm) & is.na(freedomhouse)) | 
                 (is.na(freedomhouse_pmm) & !is.na(freedomhouse)) | 
                 (freedomhouse_pmm != freedomhouse)) %>%
        group_by(country_name,freedomhouse_pmm,freedomhouse) %>%
        summarise(years = paste(year,collapse=", "), n = n()),
      caption = "Differences between PMM's FH values and current FH data",
      col.names = c("Country name","Freedom House value in PMM",
                    "Latest Freedom House data","years affected","n"))


## ----mainwaring_pmm_comparison_1-----------------------------------------
comparison <- democracy %>% 
  select(country_name,GWn,year,mainwaring,mainwaring_pmm) %>% 
  filter(year <= 2008, year >=1946)

kable(comparison %>% 
        filter((!is.na(mainwaring_pmm) & is.na(mainwaring)) | 
                 (is.na(mainwaring_pmm) & !is.na(mainwaring)) | 
                 (mainwaring_pmm != mainwaring)) %>%
        group_by(country_name,mainwaring_pmm,mainwaring) %>%
        summarise(min = min(year), max= max(year), n = n()),
      caption = "Differences between PMM's Mainwaring et al values and original Mainwaring et al data",
      col.names = c("Country name","Mainwaring et al value in PMM",
                    "Mainwaring et al value in original dataset","min year", "max year","n"))


## ----pacl_pmm_comparison-------------------------------------------------
comparison <- democracy %>% 
  select(country_name,GWn,year,pacl,pacl_pmm) %>% 
  filter(year <= 2008, year >=1946)

kable(comparison %>% 
        filter((!is.na(pacl_pmm) & is.na(pacl)) | 
                 (is.na(pacl_pmm) & !is.na(pacl)) | 
                 (pacl_pmm != pacl)) %>%
        group_by(country_name,pacl_pmm,pacl) %>%
        summarise(min = min(year), max= max(year), n = n()),
      caption = "Differences between PMM's PACL values and original PACL data",
      col.names = c("Country name","PACL value in PMM",
                    "Original PACL data","min year", "max year","n"))

## ----polity_pmm_comparison-----------------------------------------------
comparison <- democracy %>% 
  select(country_name,GWn,year,polity2,polity_pmm) %>% 
  filter(year <= 2008, year >=1946)

kable(comparison %>% 
        filter((!is.na(polity_pmm) & is.na(polity2)) | 
                 (is.na(polity_pmm) & !is.na(polity2)) | 
                 (polity_pmm != polity2)) %>%
        group_by(country_name,polity_pmm,polity2) %>%
        summarise(min = min(year), max= max(year), n = n()),
      caption = "Differences between PMM's Polity2 values and latest Polity IV data",
      col.names = c("Country name","Polity2 value in PMM",
                    "Latest Polity IV data","min year", "max year","n"))

## ----polyarchy_pmm_comparison--------------------------------------------

comparison <- democracy %>% 
  select(country_name,GWn,year,polyarchy_reversed,polyarchy_pmm) %>% 
  filter(year <= 2008, year >=1946)

kable(comparison %>% 
        filter((!is.na(polyarchy_pmm) & is.na(polyarchy_reversed)) | 
                 (is.na(polyarchy_pmm) & !is.na(polyarchy_reversed)) | 
                 (polyarchy_pmm != polyarchy_reversed)) %>%
        group_by(country_name,polyarchy_pmm,polyarchy_reversed) %>%
        summarise(min = min(year), max= max(year), n = n()),
      caption = "Differences between PMM's Polyarchy values and original Polyarchy data",
      col.names = c("Country name","Polyarchy value in PMM",
                    "Original Polyarchy data","min year", "max year","n"))

## ----prc_pmm_comparison_1------------------------------------------------
comparison <- democracy %>% 
  select(country_name,GWn,year,prc,prc_pmm) %>% 
  filter(year <= 2008, year >=1946)

kable(comparison %>% 
        filter((!is.na(prc_pmm) & is.na(prc)) | 
                 (is.na(prc_pmm) & !is.na(prc)) | 
                 (prc_pmm != prc)) %>%
        group_by(country_name,prc_pmm,prc) %>%
        summarise(years = paste(year,collapse=", "), n = n()),
      caption = "Differences between PMM's PRC values and original PRC data",
      col.names = c("Country name","PRC value in PMM",
                    "Original PRC data","years affected","n"))

## ----vanhanen_pmm_comparison---------------------------------------------

comparison <- democracy %>% 
  select(country_name,GWn,year,vanhanen_democratization,vanhanen_pmm) %>% 
  filter(year <= 2008, year >=1946)

kable(comparison %>% 
        filter((!is.na(vanhanen_pmm) & is.na(vanhanen_democratization)) | 
                 (is.na(vanhanen_pmm) & !is.na(vanhanen_democratization)) | 
                 (vanhanen_pmm != vanhanen_democratization)) %>%
        group_by(country_name,vanhanen_pmm,vanhanen_democratization) %>%
        summarise(years = paste(year,collapse=", "), n = n()),
      caption = "Differences between PMM's Vanhanen values and original Vanhanen data",
      col.names = c("Country name","Vanhanen value in PMM",
                    "Original Vanhanen data","years affected","n"))


