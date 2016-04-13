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

<table>
<caption>Differences between PMM's FH values and current FH data</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country name </th>
   <th style="text-align:right;"> Freedom House value in PMM </th>
   <th style="text-align:right;"> Latest Freedom House data </th>
   <th style="text-align:left;"> years affected </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Albania </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Algeria </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Andorra </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:left;"> 1973, 1974, 1975, 1976 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Andorra </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:left;"> 1972 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Angola </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Antigua &amp; Barbuda </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Antigua &amp; Barbuda </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Argentina </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Argentina </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Austria </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bahamas </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bahamas </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bahrain </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bangladesh </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bangladesh </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Barbados </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Belgium </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Belize </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Benin </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bhutan </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bolivia </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bolivia </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Botswana </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brunei </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:left;"> 1972, 1973, 1974, 1975, 1976 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bulgaria </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burkina Faso (Upper Volta) </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burundi </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burundi </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cambodia (Kampuchea) </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cameroon </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Canada </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cape Verde </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Central African Republic </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chad </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chile </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Colombia </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Comoros </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Comoros </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Congo </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Congo </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:left;"> 1993 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Congo, Democratic Republic of (Zaire) </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:left;"> 1977, 1978, 1982 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Congo, Democratic Republic of (Zaire) </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Costa Rica </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cote D’Ivoire </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1980 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cote D’Ivoire </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:left;"> 1999 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cote D’Ivoire </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cuba </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cyprus </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Czechoslovakia </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Denmark </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Djibouti </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dominica </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dominican Republic </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> East Timor </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1999 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> East Timor </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:left;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> East Timor </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:left;"> 2001 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ecuador </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Egypt </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> El Salvador </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Equatorial Guinea </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ethiopia </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fiji </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Finland </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> France </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gabon </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gambia </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> German Democratic Republic </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> German Federal Republic </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ghana </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Greece </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Grenada </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Grenada </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guatemala </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guinea </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guinea-Bissau </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guinea-Bissau </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guyana </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guyana </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Haiti </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Honduras </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Honduras </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hungary </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Iceland </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> India </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:left;"> 1976 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> India </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Indonesia </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Iran (Persia) </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Iraq </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ireland </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Israel </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Italy/Sardinia </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Jamaica </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Japan </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Jordan </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kenya </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kiribati </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kiribati </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Korea, People's Republic of </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Korea, Republic of </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Korea, Republic of </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kuwait </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laos </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lebanon </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lesotho </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Liberia </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:left;"> 2001 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Liberia </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Liberia </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Libya </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Luxembourg </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Madagascar (Malagasy) </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Malawi </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Malaysia </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Maldives </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mali </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Malta </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Malta </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mauritania </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mauritius </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mauritius </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mexico </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Monaco </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:left;"> 1972, 1973, 1974, 1975, 1976 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Monaco </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:left;"> 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008 </td>
   <td style="text-align:right;"> 15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mongolia </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Morocco </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mozambique </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mozambique </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Myanmar (Burma) </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Myanmar (Burma) </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Namibia </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:left;"> 1972, 1973, 1974 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Namibia </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:left;"> 1989 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nauru </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nepal </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Netherlands </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> New Zealand </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nicaragua </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Niger </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nigeria </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Norway </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Oman </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pakistan </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Panama </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Panama </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Papua New Guinea </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Paraguay </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:left;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Philippines </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Philippines </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Poland </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Poland </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Portugal </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Portugal </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Qatar </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rumania </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Russia (Soviet Union) </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rwanda </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Saint Lucia </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Saint Vincent and the Grenadines </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Samoa/Western Samoa </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> San Marino </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:left;"> 1972, 1973, 1974, 1975, 1976 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Saudi Arabia </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Saudi Arabia </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Senegal </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Seychelles </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sierra Leone </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Singapore </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Solomon Islands </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Somalia </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> South Africa </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1972, 1981 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Spain </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Spain </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sri Lanka (Ceylon) </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> 5.5 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sri Lanka (Ceylon) </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sudan </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Surinam </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Surinam </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Surinam </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Swaziland </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1978 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Swaziland </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sweden </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Switzerland </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Syria </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Syria </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> São Tomé and Principe </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> São Tomé and Principe </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Taiwan </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1980 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Taiwan </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Taiwan </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Taiwan </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1978 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tajikistan </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tanzania/Tanganyika </td>
   <td style="text-align:right;"> 2.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Thailand </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Togo </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tonga </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Trinidad and Tobago </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tunisia </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turkey (Ottoman Empire) </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turkey (Ottoman Empire) </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tuvalu </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Uganda </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Uganda </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> United Arab Emirates </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> United Kingdom </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> United States of America </td>
   <td style="text-align:right;"> 7.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Uruguay </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Uruguay </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Vanuatu </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Vanuatu </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Venezuela </td>
   <td style="text-align:right;"> 6.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Vietnam, Democratic Republic of </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Yemen (Arab Republic of Yemen) </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Yemen, People's Republic of </td>
   <td style="text-align:right;"> 1.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Yugoslavia </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zambia </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zimbabwe (Rhodesia) </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zimbabwe (Rhodesia) </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

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

<table>
<caption>Differences between PMM's Mainwaring et al values and original Mainwaring et al data</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country name </th>
   <th style="text-align:right;"> Mainwaring et al value in PMM </th>
   <th style="text-align:right;"> Mainwaring et al value in original dataset </th>
   <th style="text-align:right;"> min year </th>
   <th style="text-align:right;"> max year </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Bolivia </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1964 </td>
   <td style="text-align:right;"> 1984 </td>
   <td style="text-align:right;"> 21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1954 </td>
   <td style="text-align:right;"> 1955 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chile </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1972 </td>
   <td style="text-align:right;"> 27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Costa Rica </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1947 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cuba </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1952 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cuba </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1951 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dominican Republic </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1961 </td>
   <td style="text-align:right;"> 16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> El Salvador </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1966 </td>
   <td style="text-align:right;"> 21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Haiti </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Honduras </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1956 </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mexico </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1987 </td>
   <td style="text-align:right;"> 42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nicaragua </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1983 </td>
   <td style="text-align:right;"> 38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Panama </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1947 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Paraguay </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1988 </td>
   <td style="text-align:right;"> 43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1947 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Uruguay </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1972 </td>
   <td style="text-align:right;"> 27 </td>
  </tr>
</tbody>
</table>

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

<table>
<caption>Differences between PMM's PACL values and original PACL data</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country name </th>
   <th style="text-align:right;"> PACL value in PMM </th>
   <th style="text-align:right;"> Original PACL data </th>
   <th style="text-align:right;"> min year </th>
   <th style="text-align:right;"> max year </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Liechtenstein </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Marshall Islands </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nauru </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1968 </td>
   <td style="text-align:right;"> 1971 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zimbabwe (Rhodesia) </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1965 </td>
   <td style="text-align:right;"> 1966 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
</tbody>
</table>


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

<table>
<caption>Differences between PMM's Polity2 values and latest Polity IV data</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country name </th>
   <th style="text-align:right;"> Polity2 value in PMM </th>
   <th style="text-align:right;"> Latest Polity IV data </th>
   <th style="text-align:right;"> min year </th>
   <th style="text-align:right;"> max year </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Bhutan </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> 2005 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cape Verde </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> 1975 </td>
   <td style="text-align:right;"> 1984 </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cape Verde </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> 1985 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cape Verde </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cape Verde </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cape Verde </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Czech Republic </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Czechoslovakia </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1947 </td>
   <td style="text-align:right;"> 1947 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ethiopia </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ethiopia </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> 2005 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Jamaica </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1959 </td>
   <td style="text-align:right;"> 1961 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Korea, People's Republic of </td>
   <td style="text-align:right;"> -9 </td>
   <td style="text-align:right;"> -10 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kosovo </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lebanon </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2005 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Luxembourg </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 63 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Moldova </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 2005 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Montenegro </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Montenegro </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mozambique </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Myanmar (Burma) </td>
   <td style="text-align:right;"> -8 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Oman </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1950 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Senegal </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Serbia </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Serbia </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Singapore </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1959 </td>
   <td style="text-align:right;"> 1962 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Surinam </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> 1982 </td>
   <td style="text-align:right;"> 1986 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Surinam </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1980 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Surinam </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Surinam </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1975 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Yugoslavia </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

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

<table>
<caption>Differences between PMM's Polyarchy values and original Polyarchy data</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country name </th>
   <th style="text-align:right;"> Polyarchy value in PMM </th>
   <th style="text-align:right;"> Original Polyarchy data </th>
   <th style="text-align:right;"> min year </th>
   <th style="text-align:right;"> max year </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Algeria </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brunei </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1985 </td>
   <td style="text-align:right;"> 1985 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burundi </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Colombia </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> East Timor </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Egypt </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eritrea </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fiji </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> German Federal Republic </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Iran (Persia) </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mongolia </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Myanmar (Burma) </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Oman </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Panama </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Poland </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Russia (Soviet Union) </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> San Marino </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1985 </td>
   <td style="text-align:right;"> 1985 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Senegal </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Solomon Islands </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tonga </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Uganda </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ukraine </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Uruguay </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Venezuela </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Western Sahara </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zimbabwe (Rhodesia) </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

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

<table>
<caption>Differences between PMM's PRC values and original PRC data</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country name </th>
   <th style="text-align:right;"> PRC value in PMM </th>
   <th style="text-align:right;"> Original PRC data </th>
   <th style="text-align:left;"> years affected </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Albania </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Algeria </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1988 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Argentina </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1983 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Argentina </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1955 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bangladesh </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1972, 1990 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bangladesh </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1974 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bangladesh </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1971 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Benin </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1963 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bolivia </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bolivia </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bolivia </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1964 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bosnia-Herzegovina </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1998 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bulgaria </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burkina Faso (Upper Volta) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1969 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burkina Faso (Upper Volta) </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1980 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burundi </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burundi </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1996 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cambodia (Kampuchea) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1955, 1993 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cambodia (Kampuchea) </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1957 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Central African Republic </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Central African Republic </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1993 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chad </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1996 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chile </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1988 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chile </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1952 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chile </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1973 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Colombia </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1958 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Colombia </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1949 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Congo </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Congo </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Congo </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1997 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Congo </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1963 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Costa Rica </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1949 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cote D’Ivoire </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1995 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Croatia </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Czechoslovakia </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1989 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Czechoslovakia </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Czechoslovakia </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1947 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dominican Republic </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1978 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dominican Republic </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1963 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ecuador </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1975 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ecuador </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1948 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ecuador </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1968, 1979 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ecuador </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1963, 1970 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ecuador </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1984 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Estonia </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ethiopia </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1995 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gabon </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1994 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Georgia </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> German Democratic Republic </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1946, 1947, 1948, 1990 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> German Federal Republic </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1949 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> German Federal Republic </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1946, 1947, 1948 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ghana </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1978 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ghana </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ghana </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1969, 1979 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ghana </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1982 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Greece </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1950 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Greece </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1974 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guatemala </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1983 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guatemala </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1996 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guatemala </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1954 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Haiti </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1994 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Haiti </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Honduras </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1957 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Honduras </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1954, 1963 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Honduras </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1996 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hungary </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1989 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kenya </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kenya </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1979 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kenya </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Korea, Republic of </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1987 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Korea, Republic of </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1948 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kuwait </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1961, 1962 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laos </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1957 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Latvia </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Latvia </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lebanon </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1989 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lebanon </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lithuania </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lithuania </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Madagascar (Malagasy) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Malawi </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1993 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mexico </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1988 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mexico </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1997 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mongolia </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1988 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mongolia </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Namibia </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1998 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nigeria </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1975 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nigeria </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1979 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nigeria </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1983 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pakistan </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1988 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pakistan </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1958, 1977 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pakistan </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Panama </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1989 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Panama </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1994 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1977 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1956, 1963 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1980 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1948, 1962, 1968 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Philippines </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1953 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Philippines </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1972 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Poland </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Poland </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1946 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Portugal </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1976 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rumania </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Russia (Soviet Union) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rwanda </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1963 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rwanda </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> 1961 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Senegal </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1974 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Senegal </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1962 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sierra Leone </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1968 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Slovakia </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1998 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Slovenia </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1989 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Slovenia </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Spain </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1976 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sri Lanka (Ceylon) </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1983 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sudan </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1964 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sudan </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1958 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sudan </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1955 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Taiwan </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1988 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Taiwan </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tanzania/Tanganyika </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1995 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tanzania/Tanganyika </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1965 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tanzania/Tanganyika </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1962 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Thailand </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1973 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Thailand </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1986 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Thailand </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Thailand </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1947 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Thailand </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1976 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turkey (Ottoman Empire) </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1961 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turkey (Ottoman Empire) </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1983 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turkey (Ottoman Empire) </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1980 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Turkey (Ottoman Empire) </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1957 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ukraine </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Uruguay </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1981 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Venezuela </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1947 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Venezuela </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1948 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Vietnam, Republic of </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1954 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Yemen (Arab Republic of Yemen) </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1946, 1947 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Yugoslavia </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Yugoslavia </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> 1992, 1993, 1994, 1995, 1996, 1997, 1998 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zambia </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zambia </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zambia </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> 1971 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

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

<table>
<caption>Differences between PMM's Vanhanen values and original Vanhanen data</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country name </th>
   <th style="text-align:right;"> Vanhanen value in PMM </th>
   <th style="text-align:right;"> Original Vanhanen data </th>
   <th style="text-align:left;"> years affected </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Burundi </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:left;"> 1961 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Japan </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 32.8 </td>
   <td style="text-align:left;"> 2008 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Montenegro </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 19.5 </td>
   <td style="text-align:left;"> 2003, 2004, 2005 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Morocco </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 5.1 </td>
   <td style="text-align:left;"> 2003, 2004, 2005, 2006 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Myanmar (Burma) </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 1.8 </td>
   <td style="text-align:left;"> 1947 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rumania </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 22.8 </td>
   <td style="text-align:left;"> 2003 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rumania </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 25.3 </td>
   <td style="text-align:left;"> 2004, 2005, 2006 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Vietnam, Republic of </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:left;"> 1954 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

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
