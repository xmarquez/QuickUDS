# Differences between PMM's replication data and original democracy data sources
Xavier Marquez  
`r Sys.Date()`  



# Differences between PMM's replication data and the original data sources

This package incorporates the replication dataset for Pemstein, Meserve, and Melton (2010) in its replication data (Pemstein, Meserve, and Melton 2013). These measures are labeled `_pmm` in the `democracy` dataset. However, some of these measures (Freedom House, Mainwaring et al, DD/PACL, Polity IV, Polyarchy, PRC, Vanhanen) differ from the original sources in a small number of cases, for a number of reasons having to do with data revisions after 2008 and transcription errors. This vignette documents these differences.

## Freedom House


```r
library(QuickUDS)
library(dplyr)
comparison <- democracy %>% 
  select(country_name,GWn,year,freedomhouse,freedomhouse_pmm) %>% 
  filter(year >= 1946, year <= 2008)
```

There are in total 255 differences between PMM's data and the current Freedom House data (Freedom House 2016). These differences seem to be due to data revisions since 2010 in the Freedom House dataset. 

The main problem is the treatment of 1981, which is conventionally taken to be "missing data" in the Freedom House series but which appears to be interpolated in PMM's replication dataset. But there is also one data point for 1972 (South Africa) for which the original data gives two values (a value for the "competitive" white regime and a value for the less free overall regime) and which is assigned an `NA` value in this package.


```r
kable(comparison %>% 
        filter((!is.na(freedomhouse_pmm) & is.na(freedomhouse)) | 
                 (is.na(freedomhouse_pmm) & !is.na(freedomhouse)) | 
                 (freedomhouse_pmm != freedomhouse)) %>%
        group_by(country_name,freedomhouse_pmm,freedomhouse) %>%
        summarise(years = paste(year,collapse=", "), n = n()),
      caption = "Differences between PMM's FH values and current FH data",
      col.names = c("Country name","Freedom House value in PMM",
                    "Latest Freedom House data","years affected","n"))
```



Table: Differences between PMM's FH values and current FH data

Country name                             Freedom House value in PMM   Latest Freedom House data  years affected                                                                               n
--------------------------------------  ---------------------------  --------------------------  -----------------------------------------------------------------------------------------  ---
Afghanistan                                                     1.0                          NA  1981                                                                                         1
Albania                                                         1.0                          NA  1981                                                                                         1
Algeria                                                         2.0                          NA  1981                                                                                         1
Andorra                                                          NA                         4.0  1973, 1974, 1975, 1976                                                                       4
Andorra                                                          NA                         4.5  1972                                                                                         1
Angola                                                          1.0                          NA  1981                                                                                         1
Antigua & Barbuda                                               5.5                         6.0  1982                                                                                         1
Antigua & Barbuda                                               5.5                          NA  1981                                                                                         1
Argentina                                                       5.0                         2.5  1982                                                                                         1
Argentina                                                       5.0                          NA  1981                                                                                         1
Australia                                                       7.0                          NA  1981                                                                                         1
Austria                                                         7.0                          NA  1981                                                                                         1
Bahamas                                                         6.0                         6.5  1982                                                                                         1
Bahamas                                                         6.0                          NA  1981                                                                                         1
Bahrain                                                         3.0                          NA  1981                                                                                         1
Bangladesh                                                      2.5                         3.0  1982                                                                                         1
Bangladesh                                                      2.5                          NA  1981                                                                                         1
Barbados                                                        7.0                          NA  1981                                                                                         1
Belgium                                                         7.0                          NA  1981                                                                                         1
Belize                                                          6.5                          NA  1981                                                                                         1
Benin                                                           1.5                          NA  1981                                                                                         1
Bhutan                                                          3.0                          NA  1981                                                                                         1
Bolivia                                                         5.5                         2.5  1982                                                                                         1
Bolivia                                                         5.5                          NA  1981                                                                                         1
Botswana                                                        5.5                          NA  1981                                                                                         1
Brazil                                                          5.0                         4.5  1982                                                                                         1
Brazil                                                          5.0                          NA  1981                                                                                         1
Brunei                                                           NA                         2.5  1972, 1973, 1974, 1975, 1976                                                                 5
Bulgaria                                                        1.0                          NA  1981                                                                                         1
Burkina Faso (Upper Volta)                                      2.5                          NA  1981                                                                                         1
Burundi                                                         2.0                         1.5  1982                                                                                         1
Burundi                                                         2.0                          NA  1981                                                                                         1
Cambodia (Kampuchea)                                            1.0                          NA  1981                                                                                         1
Cameroon                                                        2.0                          NA  1981                                                                                         1
Canada                                                          7.0                          NA  1981                                                                                         1
Cape Verde                                                      2.0                          NA  1981                                                                                         1
Central African Republic                                        2.0                          NA  1981                                                                                         1
Chad                                                            1.5                          NA  1981                                                                                         1
Chile                                                           2.5                          NA  1981                                                                                         1
China                                                           2.0                          NA  1981                                                                                         1
Colombia                                                        5.5                          NA  1981                                                                                         1
Comoros                                                         4.0                         3.5  1982                                                                                         1
Comoros                                                         4.0                          NA  1981                                                                                         1
Congo                                                           1.5                          NA  1981                                                                                         1
Congo                                                           4.0                         5.0  1993                                                                                         1
Congo, Democratic Republic of (Zaire)                           1.5                         2.0  1977, 1978, 1982                                                                             3
Congo, Democratic Republic of (Zaire)                           1.5                          NA  1981                                                                                         1
Costa Rica                                                      7.0                          NA  1981                                                                                         1
Cote D’Ivoire                                                   2.5                         3.0  1980                                                                                         1
Cote D’Ivoire                                                   3.0                         2.5  1999                                                                                         1
Cote D’Ivoire                                                   3.0                          NA  1981                                                                                         1
Cuba                                                            2.0                          NA  1981                                                                                         1
Cyprus                                                          6.5                          NA  1981                                                                                         1
Czechoslovakia                                                  1.5                          NA  1981                                                                                         1
Denmark                                                         7.0                          NA  1981                                                                                         1
Djibouti                                                        2.5                          NA  1981                                                                                         1
Dominica                                                        6.0                          NA  1981                                                                                         1
Dominican Republic                                              6.5                          NA  1981                                                                                         1
East Timor                                                       NA                         3.0  1999                                                                                         1
East Timor                                                       NA                         3.5  2000                                                                                         1
East Timor                                                       NA                         4.0  2001                                                                                         1
Ecuador                                                         6.0                          NA  1981                                                                                         1
Egypt                                                           3.0                          NA  1981                                                                                         1
El Salvador                                                     3.5                          NA  1981                                                                                         1
Equatorial Guinea                                               1.5                          NA  1981                                                                                         1
Ethiopia                                                        1.0                          NA  1981                                                                                         1
Fiji                                                            6.0                          NA  1981                                                                                         1
Finland                                                         6.0                          NA  1981                                                                                         1
France                                                          6.5                          NA  1981                                                                                         1
Gabon                                                           2.0                          NA  1981                                                                                         1
Gambia                                                          4.5                          NA  1981                                                                                         1
German Democratic Republic                                      1.0                          NA  1981                                                                                         1
German Federal Republic                                         6.5                          NA  1981                                                                                         1
Ghana                                                           2.5                          NA  1981                                                                                         1
Greece                                                          6.5                          NA  1981                                                                                         1
Grenada                                                         2.0                         2.5  1982                                                                                         1
Grenada                                                         2.0                          NA  1981                                                                                         1
Guatemala                                                       2.0                          NA  1981                                                                                         1
Guinea                                                          1.0                          NA  1981                                                                                         1
Guinea-Bissau                                                   1.5                         2.0  1982                                                                                         1
Guinea-Bissau                                                   1.5                          NA  1981                                                                                         1
Guyana                                                          3.0                         3.5  1982                                                                                         1
Guyana                                                          3.0                          NA  1981                                                                                         1
Haiti                                                           1.5                          NA  1981                                                                                         1
Honduras                                                        5.0                         5.5  1982                                                                                         1
Honduras                                                        5.0                          NA  1981                                                                                         1
Hungary                                                         2.5                          NA  1981                                                                                         1
Iceland                                                         7.0                          NA  1981                                                                                         1
India                                                           4.5                         4.0  1976                                                                                         1
India                                                           5.5                          NA  1981                                                                                         1
Indonesia                                                       3.0                          NA  1981                                                                                         1
Iran (Persia)                                                   2.0                          NA  1981                                                                                         1
Iraq                                                            1.5                          NA  1981                                                                                         1
Ireland                                                         7.0                          NA  1981                                                                                         1
Israel                                                          6.0                          NA  1981                                                                                         1
Italy/Sardinia                                                  6.5                          NA  1981                                                                                         1
Jamaica                                                         5.5                          NA  1981                                                                                         1
Japan                                                           7.0                          NA  1981                                                                                         1
Jordan                                                          2.0                          NA  1981                                                                                         1
Kenya                                                           3.0                          NA  1981                                                                                         1
Kiribati                                                        6.5                         6.0  1982                                                                                         1
Kiribati                                                        6.5                          NA  1981                                                                                         1
Korea, People's Republic of                                     1.0                          NA  1981                                                                                         1
Korea, Republic of                                              2.5                         3.0  1982                                                                                         1
Korea, Republic of                                              2.5                          NA  1981                                                                                         1
Kuwait                                                          4.0                          NA  1981                                                                                         1
Laos                                                            1.0                          NA  1981                                                                                         1
Lebanon                                                         3.5                          NA  1981                                                                                         1
Lesotho                                                         3.0                          NA  1981                                                                                         1
Liberia                                                         2.5                         2.0  2001                                                                                         1
Liberia                                                         3.0                         2.0  1982                                                                                         1
Liberia                                                         3.0                          NA  1981                                                                                         1
Libya                                                           2.0                          NA  1981                                                                                         1
Luxembourg                                                      7.0                          NA  1981                                                                                         1
Madagascar (Malagasy)                                           2.0                          NA  1981                                                                                         1
Malawi                                                          1.5                          NA  1981                                                                                         1
Malaysia                                                        4.5                          NA  1981                                                                                         1
Maldives                                                        3.0                          NA  1981                                                                                         1
Mali                                                            1.5                          NA  1981                                                                                         1
Malta                                                           5.0                         5.5  1982                                                                                         1
Malta                                                           5.0                          NA  1981                                                                                         1
Mauritania                                                      1.5                          NA  1981                                                                                         1
Mauritius                                                       6.0                         5.5  1982                                                                                         1
Mauritius                                                       6.0                          NA  1981                                                                                         1
Mexico                                                          4.5                          NA  1981                                                                                         1
Monaco                                                           NA                         5.0  1972, 1973, 1974, 1975, 1976                                                                 5
Monaco                                                           NA                         6.5  1993, 1994, 1995, 1996, 1997, 1998, 1999, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008    15
Mongolia                                                        1.0                          NA  1981                                                                                         1
Morocco                                                         3.5                          NA  1981                                                                                         1
Mozambique                                                      1.5                         1.0  1982                                                                                         1
Mozambique                                                      1.5                          NA  1981                                                                                         1
Myanmar (Burma)                                                 1.0                         1.5  1982                                                                                         1
Myanmar (Burma)                                                 1.0                          NA  1981                                                                                         1
Namibia                                                          NA                         2.5  1972, 1973, 1974                                                                             3
Namibia                                                          NA                         4.5  1989                                                                                         1
Nauru                                                           6.0                          NA  1981                                                                                         1
Nepal                                                           4.5                          NA  1981                                                                                         1
Netherlands                                                     7.0                          NA  1981                                                                                         1
New Zealand                                                     7.0                          NA  1981                                                                                         1
Nicaragua                                                       2.5                          NA  1981                                                                                         1
Niger                                                           1.5                          NA  1981                                                                                         1
Nigeria                                                         5.5                          NA  1981                                                                                         1
Norway                                                          7.0                          NA  1981                                                                                         1
Oman                                                            2.0                          NA  1981                                                                                         1
Pakistan                                                        2.0                          NA  1981                                                                                         1
Panama                                                          3.5                         3.0  1982                                                                                         1
Panama                                                          3.5                          NA  1981                                                                                         1
Papua New Guinea                                                6.0                          NA  1981                                                                                         1
Paraguay                                                        3.0                          NA  1981                                                                                         1
Peru                                                            5.0                         4.5  2000                                                                                         1
Peru                                                            5.5                          NA  1981                                                                                         1
Philippines                                                     3.0                         3.5  1982                                                                                         1
Philippines                                                     3.0                          NA  1981                                                                                         1
Poland                                                          2.5                         2.0  1982                                                                                         1
Poland                                                          2.5                          NA  1981                                                                                         1
Portugal                                                        6.5                         6.0  1982                                                                                         1
Portugal                                                        6.5                          NA  1981                                                                                         1
Qatar                                                           3.0                          NA  1981                                                                                         1
Rumania                                                         1.5                          NA  1981                                                                                         1
Russia (Soviet Union)                                           1.5                          NA  1981                                                                                         1
Rwanda                                                          2.0                          NA  1981                                                                                         1
Saint Lucia                                                     6.0                          NA  1981                                                                                         1
Saint Vincent and the Grenadines                                6.0                          NA  1981                                                                                         1
Samoa/Western Samoa                                             4.5                          NA  1981                                                                                         1
San Marino                                                       NA                         6.0  1972, 1973, 1974, 1975, 1976                                                                 5
Saudi Arabia                                                    1.5                         2.0  1982                                                                                         1
Saudi Arabia                                                    1.5                          NA  1981                                                                                         1
Senegal                                                         4.0                          NA  1981                                                                                         1
Seychelles                                                      2.0                          NA  1981                                                                                         1
Sierra Leone                                                    3.0                          NA  1981                                                                                         1
Singapore                                                       3.5                          NA  1981                                                                                         1
Solomon Islands                                                 6.0                          NA  1981                                                                                         1
Somalia                                                         1.0                          NA  1981                                                                                         1
South Africa                                                    2.5                          NA  1972, 1981                                                                                   2
Spain                                                           6.5                         5.5  1982                                                                                         1
Spain                                                           6.5                          NA  1981                                                                                         1
Sri Lanka (Ceylon)                                              4.5                         5.5  1982                                                                                         1
Sri Lanka (Ceylon)                                              4.5                          NA  1981                                                                                         1
Sudan                                                           3.0                          NA  1981                                                                                         1
Surinam                                                         1.5                         2.0  1982                                                                                         1
Surinam                                                         1.5                          NA  1981                                                                                         1
Surinam                                                         4.5                         3.0  1990                                                                                         1
Swaziland                                                       2.5                         3.0  1978                                                                                         1
Swaziland                                                       3.0                          NA  1981                                                                                         1
Sweden                                                          7.0                          NA  1981                                                                                         1
Switzerland                                                     7.0                          NA  1981                                                                                         1
Syria                                                           1.5                         2.0  1982                                                                                         1
Syria                                                           1.5                          NA  1981                                                                                         1
São Tomé and Principe                                           1.0                         2.0  1982                                                                                         1
São Tomé and Principe                                           1.0                          NA  1981                                                                                         1
Taiwan                                                          2.5                         3.0  1980                                                                                         1
Taiwan                                                          3.0                         5.0  1991                                                                                         1
Taiwan                                                          3.0                          NA  1981                                                                                         1
Taiwan                                                          3.5                         3.0  1978                                                                                         1
Tajikistan                                                      5.0                         3.0  1991                                                                                         1
Tanzania/Tanganyika                                             2.0                          NA  1981                                                                                         1
Thailand                                                        4.5                          NA  1981                                                                                         1
Togo                                                            1.5                          NA  1981                                                                                         1
Tonga                                                           4.0                          NA  1981                                                                                         1
Trinidad and Tobago                                             6.5                          NA  1981                                                                                         1
Tunisia                                                         3.0                          NA  1981                                                                                         1
Turkey (Ottoman Empire)                                         3.5                         3.0  1982                                                                                         1
Turkey (Ottoman Empire)                                         3.5                          NA  1981                                                                                         1
Tuvalu                                                          6.5                          NA  1981                                                                                         1
Uganda                                                          3.5                         3.0  1982                                                                                         1
Uganda                                                          3.5                          NA  1981                                                                                         1
United Arab Emirates                                            3.0                          NA  1981                                                                                         1
United Kingdom                                                  7.0                          NA  1981                                                                                         1
United States of America                                        7.0                          NA  1981                                                                                         1
Uruguay                                                         3.5                         3.0  1982                                                                                         1
Uruguay                                                         3.5                          NA  1981                                                                                         1
Vanuatu                                                         5.0                         6.0  1982                                                                                         1
Vanuatu                                                         5.0                          NA  1981                                                                                         1
Venezuela                                                       6.5                          NA  1981                                                                                         1
Vietnam, Democratic Republic of                                 1.5                          NA  1981                                                                                         1
Yemen (Arab Republic of Yemen)                                  2.5                          NA  1981                                                                                         1
Yemen, People's Republic of                                     1.5                          NA  1981                                                                                         1
Yugoslavia                                                      2.5                          NA  1981                                                                                         1
Zambia                                                          2.5                          NA  1981                                                                                         1
Zimbabwe (Rhodesia)                                             3.5                         4.0  1982                                                                                         1
Zimbabwe (Rhodesia)                                             3.5                          NA  1981                                                                                         1

## The Mainwaring et al. dataset

PMM's replication data is actually missing a fair number of the data points in the original data by Mainwaring et al (Mainwaring, Brinks, and Perez Linan 2008), but the original data is not missing any of their data points, and there are no differences between the data points wherever both the original and the replication data have values. 


```r
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
```



Table: Differences between PMM's Mainwaring et al values and original Mainwaring et al data

Country name          Mainwaring et al value in PMM   Mainwaring et al value in original dataset   min year   max year    n
-------------------  ------------------------------  -------------------------------------------  ---------  ---------  ---
Bolivia                                          NA                                           -1       1946       1946    1
Brazil                                           NA                                           -1       1964       1984   21
Brazil                                           NA                                            0       1954       1955    2
Brazil                                           NA                                            1       1946       2007   39
Chile                                            NA                                            1       1946       1972   27
Costa Rica                                       NA                                            1       1946       1947    2
Cuba                                             NA                                           -1       1952       2007   56
Cuba                                             NA                                            0       1946       1951    6
Dominican Republic                               NA                                           -1       1946       1961   16
El Salvador                                      NA                                           -1       1946       1966   21
Haiti                                            NA                                           -1       1946       1994   49
Honduras                                         NA                                           -1       1946       1956   11
Mexico                                           NA                                           -1       1946       1987   42
Nicaragua                                        NA                                           -1       1946       1983   38
Panama                                           NA                                            0       1946       1947    2
Paraguay                                         NA                                           -1       1946       1988   43
Peru                                             NA                                            0       1946       1947    2
Uruguay                                          NA                                            1       1946       1972   27

## The DD/PACL/ACLP dataset

A few country-years in the original PACL/DD dataset (Cheibub, Gandhi, and Vreeland 2010) are missing from PMM's replication dataset.


```r
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
```



Table: Differences between PMM's PACL values and original PACL data

Country name           PACL value in PMM   Original PACL data   min year   max year    n
--------------------  ------------------  -------------------  ---------  ---------  ---
Liechtenstein                         NA                    1       1946       1991   41
Marshall Islands                      NA                    1       1990       1990    1
Nauru                                 NA                    1       1968       1971    4
Zimbabwe (Rhodesia)                   NA                    0       1965       1966    2


## The Polity IV dataset

There are 202 country-years where PMM's replication data differ from the latest version of Polity IV, either because they have no data, or because they have a different value. These differences seem to be due to minor data revisions since 2010 in the Polity IV dataset.


```r
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
```



Table: Differences between PMM's Polity2 values and latest Polity IV data

Country name                   Polity2 value in PMM   Latest Polity IV data   min year   max year    n
----------------------------  ---------------------  ----------------------  ---------  ---------  ---
Bhutan                                           -6                      -5       2005       2007    3
Cape Verde                                       NA                      -4       1975       1984   10
Cape Verde                                       NA                      -3       1985       1989    5
Cape Verde                                       NA                      -2       1990       1990    1
Cape Verde                                       NA                       8       1991       2000   10
Cape Verde                                       NA                      10       2001       2008    8
Czech Republic                                    8                       9       2006       2008    3
Czechoslovakia                                   -1                       2       1947       1947    1
Ethiopia                                          0                       1       1993       1993    1
Ethiopia                                          1                      -3       2005       2008    4
Jamaica                                          NA                      10       1959       1961    2
Korea, People's Republic of                      -9                     -10       1994       2008   15
Kosovo                                           NA                       8       2008       2008    1
Lebanon                                           7                       6       2005       2008    4
Luxembourg                                       NA                      10       1946       2008   63
Moldova                                           8                       9       2005       2008    4
Montenegro                                        8                       9       2008       2008    1
Montenegro                                       NA                       9       2006       2007    2
Mozambique                                        6                       5       1994       2008   15
Myanmar (Burma)                                  -8                      -6       2008       2008    1
Oman                                             NA                      -6       1946       1950    5
Senegal                                           8                       7       2007       2008    2
Serbia                                            6                       8       2006       2006    1
Serbia                                           NA                       8       2007       2008    2
Singapore                                        NA                       7       1959       1962    3
Surinam                                          NA                      -6       1982       1986    5
Surinam                                          NA                      -1       1980       1989    5
Surinam                                          NA                       2       1990       1990    1
Surinam                                          NA                       5       1975       2008   23
Yugoslavia                                       NA                       6       2006       2006    1

## The Polyarchy dataset

22 country-years differ between PMM's replication data and the original Polyarchy dataset (Coppedge and Reinicke 1991), and four are missing. These seem to be due to simple transcription errors.


```r
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
```



Table: Differences between PMM's Polyarchy values and original Polyarchy data

Country name               Polyarchy value in PMM   Original Polyarchy data   min year   max year    n
------------------------  -----------------------  ------------------------  ---------  ---------  ---
Algeria                                         7                         6       2000       2000    1
Brunei                                         NA                         3       1985       1985    1
Burundi                                         4                         5       2000       2000    1
Colombia                                        7                         8       2000       2000    1
East Timor                                     NA                        10       2000       2000    1
Egypt                                           6                         4       2000       2000    1
Eritrea                                         2                         3       2000       2000    1
Fiji                                            4                         5       2000       2000    1
German Federal Republic                         9                        10       2000       2000    1
Iran (Persia)                                   3                         5       2000       2000    1
Mongolia                                        8                         9       2000       2000    1
Myanmar (Burma)                                 0                         1       2000       2000    1
Oman                                            2                         3       2000       2000    1
Panama                                          9                        10       2000       2000    1
Poland                                          8                        10       2000       2000    1
Russia (Soviet Union)                           8                         6       2000       2000    1
San Marino                                     NA                        10       1985       1985    1
Senegal                                         7                         9       2000       2000    1
Solomon Islands                                 7                         9       2000       2000    1
Tonga                                           7                         8       2000       2000    1
Uganda                                          7                         6       2000       2000    1
Ukraine                                         9                         6       2000       2000    1
Uruguay                                         9                        10       2000       2000    1
Venezuela                                       8                        10       2000       2000    1
Western Sahara                                 NA                         0       2000       2000    1
Zimbabwe (Rhodesia)                             7                         6       2000       2000    1

## The Political Regime Change (PRC) dataset

The PRC dataset (Gasiorowski 1996, revised in Reich 2002) has more than one value per country-year for some country-years due to transitions between regimes; and these transitions are not consistently treated in PMM's replication dataset (sometimes the value for the beginning of the year is used, sometimes the value for the end of the year, and sometimes the value for the middle of the year). In this package, I use the last value in a given year for the regime in the PRC dataset, which results in the following differences:


```r
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
```



Table: Differences between PMM's PRC values and original PRC data

Country name                      PRC value in PMM   Original PRC data  years affected                               n
-------------------------------  -----------------  ------------------  -----------------------------------------  ---
Albania                                          1                   2  1990                                         1
Algeria                                          1                   2  1988                                         1
Argentina                                        2                   4  1983                                         1
Argentina                                        3                   1  1955                                         1
Bangladesh                                       1                   2  1972, 1990                                   2
Bangladesh                                       3                   1  1974                                         1
Bangladesh                                      NA                   1  1971                                         1
Benin                                            4                   1  1963                                         1
Bolivia                                          1                   2  1981                                         1
Bolivia                                          2                   4  1982                                         1
Bolivia                                          3                   1  1964                                         1
Bosnia-Herzegovina                               2                   3  1998                                         1
Bulgaria                                         2                   4  1990                                         1
Burkina Faso (Upper Volta)                       1                   2  1969                                         1
Burkina Faso (Upper Volta)                       4                   1  1980                                         1
Burundi                                          1                   2  1992                                         1
Burundi                                          3                   1  1996                                         1
Cambodia (Kampuchea)                             1                   3  1955, 1993                                   2
Cambodia (Kampuchea)                             3                   1  1957                                         1
Central African Republic                         1                   2  1991                                         1
Central African Republic                         2                   3  1993                                         1
Chad                                             1                   3  1996                                         1
Chile                                            1                   2  1988                                         1
Chile                                            3                   4  1952                                         1
Chile                                            4                   1  1973                                         1
Colombia                                         2                   4  1958                                         1
Colombia                                         3                   1  1949                                         1
Congo                                            1                   2  1991                                         1
Congo                                            2                   4  1992                                         1
Congo                                            3                   1  1997                                         1
Congo                                            4                   1  1963                                         1
Costa Rica                                       2                   4  1949                                         1
Cote D’Ivoire                                    1                   3  1995                                         1
Croatia                                         NA                   3  1990                                         1
Czechoslovakia                                   1                   2  1989                                         1
Czechoslovakia                                   2                   4  1990                                         1
Czechoslovakia                                   4                   2  1947                                         1
Dominican Republic                               1                   4  1978                                         1
Dominican Republic                               4                   1  1963                                         1
Ecuador                                          1                   2  1975                                         1
Ecuador                                          1                   3  1948                                         1
Ecuador                                          2                   3  1968, 1979                                   2
Ecuador                                          3                   1  1963, 1970                                   2
Ecuador                                          3                   4  1984                                         1
Estonia                                          2                   4  1992                                         1
Ethiopia                                         2                   3  1995                                         1
Gabon                                            1                   2  1994                                         1
Georgia                                          2                   3  1992                                         1
German Democratic Republic                      NA                   1  1946, 1947, 1948, 1990                       4
German Federal Republic                          2                   4  1949                                         1
German Federal Republic                         NA                   2  1946, 1947, 1948                             3
Ghana                                            1                   2  1978                                         1
Ghana                                            2                   3  1992                                         1
Ghana                                            2                   4  1969, 1979                                   2
Ghana                                            4                   1  1982                                         1
Greece                                           1                   3  1950                                         1
Greece                                           1                   4  1974                                         1
Guatemala                                        1                   2  1983                                         1
Guatemala                                        3                   4  1996                                         1
Guatemala                                        4                   1  1954                                         1
Haiti                                            1                   3  1994                                         1
Haiti                                            3                   1  1991                                         1
Honduras                                         1                   3  1957                                         1
Honduras                                         3                   1  1954, 1963                                   2
Honduras                                         3                   4  1996                                         1
Hungary                                          2                   4  1989                                         1
Kenya                                            1                   2  1991                                         1
Kenya                                            1                   3  1979                                         1
Kenya                                            2                   3  1992                                         1
Korea, Republic of                               1                   2  1987                                         1
Korea, Republic of                               4                   1  1948                                         1
Kuwait                                          NA                   1  1961, 1962                                   2
Laos                                             3                   4  1957                                         1
Latvia                                           2                   4  1991                                         1
Latvia                                          NA                   2  1990                                         1
Lebanon                                          1                   2  1989                                         1
Lebanon                                          2                   3  1992                                         1
Lithuania                                        2                   4  1992                                         1
Lithuania                                       NA                   2  1990                                         1
Madagascar (Malagasy)                            1                   2  1991                                         1
Malawi                                           1                   2  1993                                         1
Mexico                                           1                   3  1988                                         1
Mexico                                           3                   4  1997                                         1
Mongolia                                         1                   2  1988                                         1
Mongolia                                         2                   4  1990                                         1
Namibia                                          4                   3  1998                                         1
Nigeria                                          1                   2  1975                                         1
Nigeria                                          2                   3  1979                                         1
Nigeria                                          3                   1  1983                                         1
Pakistan                                         1                   4  1988                                         1
Pakistan                                         3                   1  1958, 1977                                   2
Pakistan                                         4                   3  1990                                         1
Panama                                           1                   3  1989                                         1
Panama                                           3                   4  1994                                         1
Peru                                             1                   2  1977                                         1
Peru                                             1                   3  1956, 1963                                   2
Peru                                             2                   4  1980                                         1
Peru                                             3                   1  1948, 1962, 1968                             3
Philippines                                      3                   4  1953                                         1
Philippines                                      4                   1  1972                                         1
Poland                                           2                   4  1990                                         1
Poland                                          NA                   1  1946                                         1
Portugal                                         2                   4  1976                                         1
Rumania                                          3                   4  1992                                         1
Russia (Soviet Union)                            1                   2  1991                                         1
Rwanda                                           4                   1  1963                                         1
Rwanda                                           4                  NA  1961                                         1
Senegal                                          1                   2  1974                                         1
Senegal                                          3                   1  1962                                         1
Sierra Leone                                     4                   3  1968                                         1
Slovakia                                         3                   4  1998                                         1
Slovenia                                        NA                   2  1989                                         1
Slovenia                                        NA                   4  1990                                         1
Spain                                            1                   2  1976                                         1
Sri Lanka (Ceylon)                               4                   3  1983                                         1
Sudan                                            1                   2  1964                                         1
Sudan                                            3                   1  1958                                         1
Sudan                                           NA                   3  1955                                         1
Taiwan                                           1                   2  1988                                         1
Taiwan                                           2                   3  1991                                         1
Tanzania/Tanganyika                              2                   3  1995                                         1
Tanzania/Tanganyika                              3                   1  1965                                         1
Tanzania/Tanganyika                              4                   3  1962                                         1
Thailand                                         1                   2  1973                                         1
Thailand                                         1                   3  1986                                         1
Thailand                                         1                   4  1992                                         1
Thailand                                         3                   1  1947                                         1
Thailand                                         4                   1  1976                                         1
Turkey (Ottoman Empire)                          1                   4  1961                                         1
Turkey (Ottoman Empire)                          2                   3  1983                                         1
Turkey (Ottoman Empire)                          4                   1  1980                                         1
Turkey (Ottoman Empire)                          4                   3  1957                                         1
Ukraine                                          2                   3  1991                                         1
Uruguay                                          1                   2  1981                                         1
Venezuela                                        2                   4  1947                                         1
Venezuela                                        4                   1  1948                                         1
Vietnam, Republic of                            NA                   1  1954                                         1
Yemen (Arab Republic of Yemen)                  NA                   1  1946, 1947                                   2
Yugoslavia                                       1                   3  1990                                         1
Yugoslavia                                      NA                   3  1992, 1993, 1994, 1995, 1996, 1997, 1998     7
Zambia                                           1                   2  1990                                         1
Zambia                                           2                   4  1991                                         1
Zambia                                           3                   1  1971                                         1

166 data points differ between the two data sources.

## Vanhanen dataset

There are some missing values in PMM's data compared to the original Vanhanen dataset (Vanhanen 2012):


```r
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
```



Table: Differences between PMM's Vanhanen values and original Vanhanen data

Country name            Vanhanen value in PMM   Original Vanhanen data  years affected             n
---------------------  ----------------------  -----------------------  -----------------------  ---
Burundi                                    NA                      2.5  1961                       1
Japan                                      NA                     32.8  2008                       1
Montenegro                                 NA                     19.5  2003, 2004, 2005           3
Morocco                                    NA                      5.1  2003, 2004, 2005, 2006     4
Myanmar (Burma)                            NA                      1.8  1947                       1
Rumania                                    NA                     22.8  2003                       1
Rumania                                    NA                     25.3  2004, 2005, 2006           3
Vietnam, Republic of                       NA                      0.0  1954                       1

# References

Cheibub, Jose Antonio, Jennifer Gandhi, and James Raymond Vreeland. 2010.
"Democracy and Dictatorship Revisited." Public Choice. 143(1):67-101.
Original data available at
https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited.

Coppedge, Michael and Wolfgang H. Reinicke. 1991. Measuring Polyarchy. In
On Measuring Democracy: Its Consequences and Concomitants, ed. Alex
Inkeles. New Brunswuck, NJ: Transaction pp. 47-68.

Freedom House. 2016. "Freedom in the World." Original data available at
http://www.freedomhouse.org.

Gasiorowski, Mark J. 1996. "An Overview of the Political Regime Change
Dataset." Comparative Political Studies 29(4):469-483.

Mainwaring, Scott, Daniel Brinks, and Anibal Perez Linan. 2008. "Political
Regimes in Latin America, 1900-2007." Original data available from
http://kellogg.nd.edu/scottmainwaring/Political_Regimes.pdf.

Marshall, Monty G., Ted Robert Gurr, and Keith Jaggers. 2012. "Polity IV:
Political Regime Characteristics and Transitions, 1800-2012." Updated to
2015. Original data available from http://www.systemicpeace.org/polity/polity4.htm.

Pemstein, Daniel, Stephen Meserve, and James Melton. 2010. Democratic
Compromise: A Latent Variable Analysis of Ten Measures of Regime Type.
Political Analysis 18 (4): 426-449.

Pemstein, Daniel, Stephen A. Meserve, and James Melton. 2013. "Replication
data for: Democratic Compromise: A Latent Variable Analysis of Ten Measures
of Regime Type." In: Harvard Dataverse. http://hdl.handle.net/1902.1/PMM

Reich, G. 2002. Categorizing Political Regimes: New Data for Old Problems.
Democratization 9 (4): 1-24. http://www.tandfonline.com/doi/pdf/10.1080/714000289.

Vanhanen, Tatu. 2012. "FSD1289 Measures of Democracy 1810-2012." Original
data available from http://www.fsd.uta.fi/english/data/catalogue/FSD1289/meF1289e.html
