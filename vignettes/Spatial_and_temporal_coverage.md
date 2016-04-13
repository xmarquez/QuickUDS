# Characteristics of Different Democracy Measures
Xavier Marquez  
`r Sys.Date()`  



This vignette describes the temporal and spatial coverage of the democracy measures included in this package,  notes their correlations, and documents any changes made to the original data sources.

# General Characteristics


```r
library(knitr)
library(QuickUDS)
library(dplyr)

print(kable(democracy_long %>% 
        group_by(variable) %>%
        summarise(distinct_countries = n_distinct(country_name),
                  distinct_years = n_distinct(year),
                  min_year = min(year),
                  max_year = max(year),
                  mean_year = mean(year),
                  index_type = unique(index_type),
                  num_values = n_distinct(value),
                  mean = mean(value),
                  median = median(value),
                  min_value = min(value),
                  max_value = max(value),
                  sd = sd(value)),
      digits = 2))
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> variable </th>
   <th style="text-align:right;"> distinct_countries </th>
   <th style="text-align:right;"> distinct_years </th>
   <th style="text-align:right;"> min_year </th>
   <th style="text-align:right;"> max_year </th>
   <th style="text-align:right;"> mean_year </th>
   <th style="text-align:left;"> index_type </th>
   <th style="text-align:right;"> num_values </th>
   <th style="text-align:right;"> mean </th>
   <th style="text-align:right;"> median </th>
   <th style="text-align:right;"> min_value </th>
   <th style="text-align:right;"> max_value </th>
   <th style="text-align:right;"> sd </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> PEPS1i </td>
   <td style="text-align:right;"> 175 </td>
   <td style="text-align:right;"> 204 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 1949.74 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 726 </td>
   <td style="text-align:right;"> -3.20 </td>
   <td style="text-align:right;"> -7.00 </td>
   <td style="text-align:right;"> -10.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 6.57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PEPS1q </td>
   <td style="text-align:right;"> 176 </td>
   <td style="text-align:right;"> 204 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 1950.37 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 727 </td>
   <td style="text-align:right;"> -3.18 </td>
   <td style="text-align:right;"> -6.24 </td>
   <td style="text-align:right;"> -10.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 6.49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PEPS1v </td>
   <td style="text-align:right;"> 177 </td>
   <td style="text-align:right;"> 204 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 1932.32 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 1866 </td>
   <td style="text-align:right;"> -2.87 </td>
   <td style="text-align:right;"> -4.00 </td>
   <td style="text-align:right;"> -10.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 5.66 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PEPS2i </td>
   <td style="text-align:right;"> 143 </td>
   <td style="text-align:right;"> 59 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 1981.28 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 843 </td>
   <td style="text-align:right;"> 3.72 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> -9.59 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 4.39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PEPS2q </td>
   <td style="text-align:right;"> 165 </td>
   <td style="text-align:right;"> 59 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 1978.99 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 856 </td>
   <td style="text-align:right;"> -1.13 </td>
   <td style="text-align:right;"> -1.46 </td>
   <td style="text-align:right;"> -10.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 6.91 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PEPS2v </td>
   <td style="text-align:right;"> 168 </td>
   <td style="text-align:right;"> 194 </td>
   <td style="text-align:right;"> 1810 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 1937.77 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 2414 </td>
   <td style="text-align:right;"> -2.43 </td>
   <td style="text-align:right;"> -3.55 </td>
   <td style="text-align:right;"> -10.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 5.78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Polity3 </td>
   <td style="text-align:right;"> 181 </td>
   <td style="text-align:right;"> 204 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 1929.05 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> -1.13 </td>
   <td style="text-align:right;"> -3.00 </td>
   <td style="text-align:right;"> -10.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 7.05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> arat_pmm </td>
   <td style="text-align:right;"> 151 </td>
   <td style="text-align:right;"> 35 </td>
   <td style="text-align:right;"> 1948 </td>
   <td style="text-align:right;"> 1982 </td>
   <td style="text-align:right;"> 1967.70 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:right;"> 73.20 </td>
   <td style="text-align:right;"> 69.00 </td>
   <td style="text-align:right;"> 29.00 </td>
   <td style="text-align:right;"> 109.00 </td>
   <td style="text-align:right;"> 18.91 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> blm </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:right;"> 1900 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1950.00 </td>
   <td style="text-align:left;"> Trichotomous </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.25 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.36 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> blm_pmm </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 55 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1973.00 </td>
   <td style="text-align:left;"> Trichotomous </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.36 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> bmr_democracy </td>
   <td style="text-align:right;"> 212 </td>
   <td style="text-align:right;"> 211 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 1938.71 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.32 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> bmr_democracy_omitteddata </td>
   <td style="text-align:right;"> 212 </td>
   <td style="text-align:right;"> 211 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 1938.89 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.32 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> bnr </td>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 93 </td>
   <td style="text-align:right;"> 1913 </td>
   <td style="text-align:right;"> 2005 </td>
   <td style="text-align:right;"> 1969.50 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.34 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> bollen_pmm </td>
   <td style="text-align:right;"> 161 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1950 </td>
   <td style="text-align:right;"> 1980 </td>
   <td style="text-align:right;"> 1965.48 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 348 </td>
   <td style="text-align:right;"> 55.46 </td>
   <td style="text-align:right;"> 53.59 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 33.70 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> doorenspleet </td>
   <td style="text-align:right;"> 172 </td>
   <td style="text-align:right;"> 195 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 1921.29 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1.18 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eiu </td>
   <td style="text-align:right;"> 175 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:right;"> 2006.91 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 783 </td>
   <td style="text-align:right;"> 0.47 </td>
   <td style="text-align:right;"> 0.45 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.97 </td>
   <td style="text-align:right;"> 0.24 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> exconst </td>
   <td style="text-align:right;"> 186 </td>
   <td style="text-align:right;"> 215 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:right;"> 1938.14 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> -88.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 17.29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> exrec </td>
   <td style="text-align:right;"> 186 </td>
   <td style="text-align:right;"> 215 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:right;"> 1938.73 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.84 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> -88.00 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 17.61 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> freedomhouse </td>
   <td style="text-align:right;"> 200 </td>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:right;"> 1972 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1994.87 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 4.26 </td>
   <td style="text-align:right;"> 4.50 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 2.06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> freedomhouse_electoral </td>
   <td style="text-align:right;"> 196 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 2002.20 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.60 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> freedomhouse_pmm </td>
   <td style="text-align:right;"> 198 </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 1972 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 1990.95 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 4.15 </td>
   <td style="text-align:right;"> 4.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 2.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> gwf </td>
   <td style="text-align:right;"> 154 </td>
   <td style="text-align:right;"> 270 </td>
   <td style="text-align:right;"> 1741 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 1969.92 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1.43 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> hadenius_pmm </td>
   <td style="text-align:right;"> 129 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1988 </td>
   <td style="text-align:right;"> 1988 </td>
   <td style="text-align:right;"> 1988.00 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:right;"> 4.51 </td>
   <td style="text-align:right;"> 3.10 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 3.56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> kailitz_binary </td>
   <td style="text-align:right;"> 198 </td>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 1982.69 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.41 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> kailitz_tri </td>
   <td style="text-align:right;"> 198 </td>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 1982.69 </td>
   <td style="text-align:left;"> Trichotomous </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.99 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.91 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> lied </td>
   <td style="text-align:right;"> 223 </td>
   <td style="text-align:right;"> 216 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1938.91 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 2.78 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 6.00 </td>
   <td style="text-align:right;"> 2.35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> lied_accountable </td>
   <td style="text-align:right;"> 223 </td>
   <td style="text-align:right;"> 216 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1938.91 </td>
   <td style="text-align:left;"> Trichotomous </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.94 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.87 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> lied_electoral </td>
   <td style="text-align:right;"> 223 </td>
   <td style="text-align:right;"> 216 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1938.91 </td>
   <td style="text-align:left;"> Trichotomous </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1.38 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.85 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> lied_inclusive </td>
   <td style="text-align:right;"> 223 </td>
   <td style="text-align:right;"> 216 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1938.91 </td>
   <td style="text-align:left;"> Trichotomous </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1.17 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.94 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> magaloni_democ_binary </td>
   <td style="text-align:right;"> 172 </td>
   <td style="text-align:right;"> 244 </td>
   <td style="text-align:right;"> 1769 </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:right;"> 1972.44 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.42 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> magaloni_regime_tri </td>
   <td style="text-align:right;"> 172 </td>
   <td style="text-align:right;"> 244 </td>
   <td style="text-align:right;"> 1769 </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:right;"> 1972.44 </td>
   <td style="text-align:left;"> Trichotomous </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2.01 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 0.92 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> mainwaring </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 108 </td>
   <td style="text-align:right;"> 1900 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 1953.60 </td>
   <td style="text-align:left;"> Trichotomous </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> -0.32 </td>
   <td style="text-align:right;"> -1.00 </td>
   <td style="text-align:right;"> -1.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.84 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> mainwaring_pmm </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 1981.10 </td>
   <td style="text-align:left;"> Trichotomous </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.12 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> -1.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.85 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> munck_pmm </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 1960 </td>
   <td style="text-align:right;"> 2005 </td>
   <td style="text-align:right;"> 1993.79 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 0.84 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pacl </td>
   <td style="text-align:right;"> 196 </td>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 1981.94 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.44 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pacl_pmm </td>
   <td style="text-align:right;"> 196 </td>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 1982.01 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.44 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pitf </td>
   <td style="text-align:right;"> 185 </td>
   <td style="text-align:right;"> 215 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:right;"> 1938.44 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2.42 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> 1.48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pitf_binary </td>
   <td style="text-align:right;"> 185 </td>
   <td style="text-align:right;"> 215 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:right;"> 1938.44 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1.36 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> polcomp </td>
   <td style="text-align:right;"> 186 </td>
   <td style="text-align:right;"> 215 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:right;"> 1938.45 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 1.29 </td>
   <td style="text-align:right;"> 6.00 </td>
   <td style="text-align:right;"> -88.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 17.77 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> polity </td>
   <td style="text-align:right;"> 186 </td>
   <td style="text-align:right;"> 215 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:right;"> 1938.14 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> -4.12 </td>
   <td style="text-align:right;"> -3.00 </td>
   <td style="text-align:right;"> -88.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 17.67 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> polity2 </td>
   <td style="text-align:right;"> 186 </td>
   <td style="text-align:right;"> 215 </td>
   <td style="text-align:right;"> 1800 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:right;"> 1938.15 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> -0.64 </td>
   <td style="text-align:right;"> -3.00 </td>
   <td style="text-align:right;"> -10.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 7.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> polity_pmm </td>
   <td style="text-align:right;"> 167 </td>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 1980.85 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 0.13 </td>
   <td style="text-align:right;"> -1.00 </td>
   <td style="text-align:right;"> -10.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 7.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> polyarchy_contestation </td>
   <td style="text-align:right;"> 196 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1985 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1993.11 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 5.82 </td>
   <td style="text-align:right;"> 6.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 9.00 </td>
   <td style="text-align:right;"> 2.90 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> polyarchy_pmm </td>
   <td style="text-align:right;"> 194 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1985 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1993.12 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 6.33 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 3.51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> polyarchy_reversed </td>
   <td style="text-align:right;"> 196 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1985 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1993.11 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 6.35 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 3.52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> prc </td>
   <td style="text-align:right;"> 149 </td>
   <td style="text-align:right;"> 252 </td>
   <td style="text-align:right;"> 1747 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:right;"> 1937.00 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 4.00 </td>
   <td style="text-align:right;"> 1.30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> prc_notrans </td>
   <td style="text-align:right;"> 149 </td>
   <td style="text-align:right;"> 252 </td>
   <td style="text-align:right;"> 1747 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:right;"> 1936.50 </td>
   <td style="text-align:left;"> Trichotomous </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 4.00 </td>
   <td style="text-align:right;"> 1.31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> prc_pmm </td>
   <td style="text-align:right;"> 148 </td>
   <td style="text-align:right;"> 53 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:right;"> 1974.83 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 2.15 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 4.00 </td>
   <td style="text-align:right;"> 1.37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> przeworski </td>
   <td style="text-align:right;"> 197 </td>
   <td style="text-align:right;"> 221 </td>
   <td style="text-align:right;"> 1788 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 1950.24 </td>
   <td style="text-align:left;"> Ordinal </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1.79 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 0.81 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> svolik </td>
   <td style="text-align:right;"> 198 </td>
   <td style="text-align:right;"> 88 </td>
   <td style="text-align:right;"> 1921 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 1980.99 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1.44 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ulfelder </td>
   <td style="text-align:right;"> 167 </td>
   <td style="text-align:right;"> 56 </td>
   <td style="text-align:right;"> 1955 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 1984.84 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.41 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> utip_dichotomous </td>
   <td style="text-align:right;"> 152 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 1963 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 1984.47 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.52 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> utip_dichotomous_strict </td>
   <td style="text-align:right;"> 152 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 1963 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 1984.47 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.48 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> utip_trichotomous </td>
   <td style="text-align:right;"> 152 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 1963 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 1984.47 </td>
   <td style="text-align:left;"> Trichotomous </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.99 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.98 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> v2x_api </td>
   <td style="text-align:right;"> 172 </td>
   <td style="text-align:right;"> 116 </td>
   <td style="text-align:right;"> 1900 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1960.99 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 9268 </td>
   <td style="text-align:right;"> 0.47 </td>
   <td style="text-align:right;"> 0.42 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.98 </td>
   <td style="text-align:right;"> 0.31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> v2x_delibdem </td>
   <td style="text-align:right;"> 171 </td>
   <td style="text-align:right;"> 116 </td>
   <td style="text-align:right;"> 1900 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1961.00 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 9827 </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.93 </td>
   <td style="text-align:right;"> 0.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> v2x_egaldem </td>
   <td style="text-align:right;"> 172 </td>
   <td style="text-align:right;"> 116 </td>
   <td style="text-align:right;"> 1900 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1960.99 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 10152 </td>
   <td style="text-align:right;"> 0.25 </td>
   <td style="text-align:right;"> 0.15 </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 0.92 </td>
   <td style="text-align:right;"> 0.25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> v2x_libdem </td>
   <td style="text-align:right;"> 172 </td>
   <td style="text-align:right;"> 116 </td>
   <td style="text-align:right;"> 1900 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1960.99 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 10593 </td>
   <td style="text-align:right;"> 0.26 </td>
   <td style="text-align:right;"> 0.15 </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 0.93 </td>
   <td style="text-align:right;"> 0.25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> v2x_mpi </td>
   <td style="text-align:right;"> 172 </td>
   <td style="text-align:right;"> 116 </td>
   <td style="text-align:right;"> 1900 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1960.99 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 6148 </td>
   <td style="text-align:right;"> 0.18 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.93 </td>
   <td style="text-align:right;"> 0.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> v2x_partipdem </td>
   <td style="text-align:right;"> 172 </td>
   <td style="text-align:right;"> 116 </td>
   <td style="text-align:right;"> 1900 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1960.97 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 9910 </td>
   <td style="text-align:right;"> 0.20 </td>
   <td style="text-align:right;"> 0.11 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.84 </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> v2x_polyarchy </td>
   <td style="text-align:right;"> 172 </td>
   <td style="text-align:right;"> 116 </td>
   <td style="text-align:right;"> 1900 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:right;"> 1960.99 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 9268 </td>
   <td style="text-align:right;"> 0.32 </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 0.96 </td>
   <td style="text-align:right;"> 0.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vanhanen_competition </td>
   <td style="text-align:right;"> 193 </td>
   <td style="text-align:right;"> 203 </td>
   <td style="text-align:right;"> 1810 </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:right;"> 1947.43 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 694 </td>
   <td style="text-align:right;"> 25.22 </td>
   <td style="text-align:right;"> 20.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 70.00 </td>
   <td style="text-align:right;"> 25.17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vanhanen_democratization </td>
   <td style="text-align:right;"> 193 </td>
   <td style="text-align:right;"> 203 </td>
   <td style="text-align:right;"> 1810 </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:right;"> 1947.43 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 445 </td>
   <td style="text-align:right;"> 8.43 </td>
   <td style="text-align:right;"> 1.10 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 49.00 </td>
   <td style="text-align:right;"> 11.68 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vanhanen_participation </td>
   <td style="text-align:right;"> 193 </td>
   <td style="text-align:right;"> 203 </td>
   <td style="text-align:right;"> 1810 </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:right;"> 1947.43 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 760 </td>
   <td style="text-align:right;"> 21.10 </td>
   <td style="text-align:right;"> 14.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 71.00 </td>
   <td style="text-align:right;"> 21.88 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> vanhanen_pmm </td>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 1981.71 </td>
   <td style="text-align:left;"> Continuous </td>
   <td style="text-align:right;"> 439 </td>
   <td style="text-align:right;"> 11.31 </td>
   <td style="text-align:right;"> 5.90 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 49.00 </td>
   <td style="text-align:right;"> 12.67 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> wahman_teorell_hadenius </td>
   <td style="text-align:right;"> 193 </td>
   <td style="text-align:right;"> 39 </td>
   <td style="text-align:right;"> 1972 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 1991.93 </td>
   <td style="text-align:left;"> Dichotomous </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.42 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.49 </td>
  </tr>
</tbody>
</table>


# Arat

This is the dataset described in Arat 1991; the actual values are taken from Pemstein, Meserve, and Melton 2013 (the replication data for Pemstein, Meserve, and Melton 2010).

## Coverage


```r
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
```

```
## Warning: package 'rworldmap' was built under R version 3.2.4
```

```
## Loading required package: sp
```

```
## ### Welcome to rworldmap ###
```

```
## For a short introduction type : 	 vignette('rworldmap')
```

```r
world <- getMap()
world <- fortify(world)
```

```
## Regions defined for each Polygons
```

```r
spatial_coverage <- function(data) {
  ggplot() +
    geom_path(data = world, aes(x=long,y=lat,group=group)) +
    theme_bw() +
    theme(legend.position = "bottom") +
    geom_count(data = data, aes(x=lon,y=lat,color = in_system)) +
    labs(color = "In G&W system of states", y = "", x = "", size = "Number of country-years") +
    ggtitle("Spatial coverage")
}

data <- democracy_long %>% filter(variable == "arat_pmm")

temporal_coverage(data)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/arat_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/arat_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/arat_distribution-1.png)

```r
ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/arat_distribution-2.png)

# BLM

This is the dataset described in Bowman, Lehoucq, and Mahoney 2005.

## Coverage


```r
data <- democracy_long %>% filter(variable == "blm")

temporal_coverage(data)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/blm_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/blm_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/blm_distribution-1.png)

# BMR

This is the dataset described in Boix, Miller, and Rosato 2012.

## Coverage


```r
data <- democracy_long %>% filter(variable == "bmr_democracy")

temporal_coverage(data)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/bmr_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/bmr_coverage-2.png)

## Distribution


```r
data <- democracy_long %>% filter(variable %in% c("bmr_democracy","bmr_democracy_omitteddata"))

ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/bmr_distribution-1.png)

# BNR

This is the dataset described in Bernhardt, Nordstrom, and Reenock 2001. The original dataset only counts periods of democracy in the period 1913-2005, since it is designed for event history analysis. To put it in country-year format, this package assumes that country-years in independent states between 1913 and 2005 are to be counted as non-democratic if they are not explicitly said to be democratic by BNR. (Country-years are considered to be independent if the state is not a microstate and appears in Gleditasch and Ward's [1999] panel of indepdent states for the period).

## Coverage


```r
data <- democracy_long %>% filter(variable == "bnr")

temporal_coverage(data)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/bnr_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/bnr_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/bnr_distribution-1.png)

# Bollen

This is the dataset described in Bollen 2001. The actual values are taken from Pemstein, Meserve, and Melton's replication data for their article (Pemstein, Meserve, and Melton 2013).

## Coverage


```r
data <- democracy_long %>% filter(variable == "bollen_pmm")

temporal_coverage(data)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/bollen_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/bollen_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/bollen_distribution-1.png)

```r
ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/bollen_distribution-2.png)

# Doorenspleet

This is the dataset described in Doorenspleet 2000.

## Coverage


```r
data <- democracy_long %>% filter(variable == "doorenspleet")

temporal_coverage(data)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/doorenspleet_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/doorenspleet_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/doorenspleet_distribution-1.png)

# EIU

This contains the Economist Intelligence Unit's index of democracy (EIU 2012). The actual data is taken from the World Bank's Governance Indicators (http://www.govindicators.org)

## Coverage


```r
data <- democracy_long %>% filter(variable == "eiu")

temporal_coverage(data)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/eiu_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/eiu_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/eiu_distribution-1.png)

```r
ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/eiu_distribution-2.png)

# Freedom House (Freedom in the World)

This is the Freedom in the World Index, to 2015 (Freedom House 2016). Some non-independent territories have been excluded from the original data.

## Coverage


```r
data <- democracy_long %>% filter(variable %in% c("freedomhouse"))

temporal_coverage(data)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/fh_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/fh_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/fh_distribution-1.png)

```r
ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/fh_distribution-2.png)

# Freedom House (Electoral Democracies)

This is Freedom House's list of electoral democracies, to 2015 (Freedom House 2016). Some non-independent territories have been excluded from the original data.

## Coverage


```r
data <- democracy_long %>% filter(variable == "freedomhouse_electoral")

temporal_coverage(data)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/fh_electoral_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/fh_electoral_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/fh_electoral_distribution-1.png)

# GWF (Geddes, Wright, and Frantz)

This is a measure of democracy/non-democracy derived from the dataset described in Geddes, Wright, and Frantz 2014. The original data has been extended beyond 1945 by reconciling the information contained in the original dataset's `gwf_startdate`, `gwf_spell`, and `gwf_casename` variables, which encode the start year of each democratic and non-democratic regime (sometimes going back to the 18th century). 

## Coverage


```r
data <- democracy_long %>% filter(variable == "gwf")

temporal_coverage(data) +
  geom_vline(xintercept = 1945) +
  annotate("text", label = "Limit of original dataset", x = 1945,y = 100, angle=90)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/gwf_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/gwf_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/gwf_distribution-1.png)


# Hadenius

This is the dataset in Hadenius 1992. Actual values taken from Pemstein, Meserve, and Melton 2013. 

## Coverage


```r
data <- democracy_long %>% filter(variable == "hadenius_pmm")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/hadenius_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/hadenius_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),bins=20) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/hadenius_distribution-1.png)

```r
ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/hadenius_distribution-2.png)

# Kailitz

The dataset described in Kailitz 2013.  

## Coverage


```r
data <- democracy_long %>% filter(variable == "kailitz_binary")

temporal_coverage(data)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/kailitz_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/kailitz_coverage-2.png)

## Distribution


```r
data <- democracy_long %>% filter(variable %in% c("kailitz_binary","kailitz_tri"))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/kailitz_distribution-1.png)

## Index construction and known problems

Note that 316 of the country-years in the Kailitz dataset are classified with more than one regime type. 


```r
print(kable(kailitz.yearly %>% 
        count(multiple_regimes = grepl("-",combined_regime))))
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> multiple_regimes </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> FALSE </td>
   <td style="text-align:right;"> 9290 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:right;"> 316 </td>
  </tr>
</tbody>
</table>

```r
print(kable(kailitz.yearly %>% 
        filter(grepl("-",combined_regime)) %>%
        group_by(country_name) %>%
        arrange(country_name,year) %>%
        group_by(combined_regime, add=TRUE) %>%
        summarise(min = min(year), max = max(year), n = n())))
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> country_name </th>
   <th style="text-align:left;"> combined_regime </th>
   <th style="text-align:right;"> min </th>
   <th style="text-align:right;"> max </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:left;"> Electoral Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Algeria </td>
   <td style="text-align:left;"> Electoral Autocracy-One party Autocracy </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Angola </td>
   <td style="text-align:left;"> Electoral Autocracy-State Failure or Occupation </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Benin </td>
   <td style="text-align:left;"> Electoral Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1960 </td>
   <td style="text-align:right;"> 1962 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Benin </td>
   <td style="text-align:left;"> Military Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1965 </td>
   <td style="text-align:right;"> 1974 </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Benin </td>
   <td style="text-align:left;"> Personalist Autocracy-Transition </td>
   <td style="text-align:right;"> 1963 </td>
   <td style="text-align:right;"> 1971 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burundi </td>
   <td style="text-align:left;"> Electoral Autocracy-State Failure or Occupation </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burundi </td>
   <td style="text-align:left;"> One party Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1982 </td>
   <td style="text-align:right;"> 1983 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cambodia (Kampuchea) </td>
   <td style="text-align:left;"> Communist Ideocracy-State Failure or Occupation </td>
   <td style="text-align:right;"> 1981 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Central African Republic </td>
   <td style="text-align:left;"> Electoral Autocracy-One party Autocracy </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Colombia </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1947 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Colombia </td>
   <td style="text-align:left;"> State Failure or Occupation-Transition </td>
   <td style="text-align:right;"> 1948 </td>
   <td style="text-align:right;"> 1952 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cuba </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1951 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ecuador </td>
   <td style="text-align:left;"> Electoral Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:right;"> 1971 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ecuador </td>
   <td style="text-align:left;"> Electoral Autocracy-Transition </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guinea-Bissau </td>
   <td style="text-align:left;"> Military Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1980 </td>
   <td style="text-align:right;"> 1983 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guinea-Bissau </td>
   <td style="text-align:left;"> Military Autocracy-Transition </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Haiti </td>
   <td style="text-align:left;"> Electoral Autocracy-Transition </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1947 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Honduras </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1957 </td>
   <td style="text-align:right;"> 1962 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Indonesia </td>
   <td style="text-align:left;"> Personalist Autocracy-Transition </td>
   <td style="text-align:right;"> 1952 </td>
   <td style="text-align:right;"> 1967 </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kuwait </td>
   <td style="text-align:left;"> Monarchy-State Failure or Occupation </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lebanon </td>
   <td style="text-align:left;"> State Failure or Occupation-Transition </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lesotho </td>
   <td style="text-align:left;"> Electoral Autocracy-State Failure or Occupation </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lesotho </td>
   <td style="text-align:left;"> Electoral Autocracy-Transition </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Liberia </td>
   <td style="text-align:left;"> Personalist Autocracy-State Failure or Occupation </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Madagascar (Malagasy) </td>
   <td style="text-align:left;"> Military Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1972 </td>
   <td style="text-align:right;"> 1974 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Madagascar (Malagasy) </td>
   <td style="text-align:left;"> Personalist Autocracy-Transition </td>
   <td style="text-align:right;"> 1975 </td>
   <td style="text-align:right;"> 1975 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mauritania </td>
   <td style="text-align:left;"> Electoral Autocracy-Military Autocracy </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mozambique </td>
   <td style="text-align:left;"> Personalist Autocracy-Transition </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nicaragua </td>
   <td style="text-align:left;"> Communist Ideocracy-Electoral Autocracy </td>
   <td style="text-align:right;"> 1984 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nicaragua </td>
   <td style="text-align:left;"> Communist Ideocracy-State Failure or Occupation </td>
   <td style="text-align:right;"> 1980 </td>
   <td style="text-align:right;"> 1981 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nicaragua </td>
   <td style="text-align:left;"> Communist Ideocracy-Transition </td>
   <td style="text-align:right;"> 1982 </td>
   <td style="text-align:right;"> 1983 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nicaragua </td>
   <td style="text-align:left;"> Electoral Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1972 </td>
   <td style="text-align:right;"> 1972 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nicaragua </td>
   <td style="text-align:left;"> Military Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1973 </td>
   <td style="text-align:right;"> 1973 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Niger </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1963 </td>
   <td style="text-align:right;"> 1967 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Philippines </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1971 </td>
   <td style="text-align:right;"> 26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Philippines </td>
   <td style="text-align:left;"> Liberal Democracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Portugal </td>
   <td style="text-align:left;"> Military Autocracy-Transition </td>
   <td style="text-align:right;"> 1974 </td>
   <td style="text-align:right;"> 1975 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Seychelles </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Seychelles </td>
   <td style="text-align:left;"> Liberal Democracy-Transition </td>
   <td style="text-align:right;"> 1976 </td>
   <td style="text-align:right;"> 1976 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Somalia </td>
   <td style="text-align:left;"> Liberal Democracy-Transition </td>
   <td style="text-align:right;"> 1960 </td>
   <td style="text-align:right;"> 1968 </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Somalia </td>
   <td style="text-align:left;"> Military Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1969 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Somalia </td>
   <td style="text-align:left;"> Military Autocracy-State Failure or Occupation </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Spain </td>
   <td style="text-align:left;"> Military Autocracy-One party Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1974 </td>
   <td style="text-align:right;"> 29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sri Lanka (Ceylon) </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1960 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sri Lanka (Ceylon) </td>
   <td style="text-align:left;"> Electoral Autocracy-Transition </td>
   <td style="text-align:right;"> 1948 </td>
   <td style="text-align:right;"> 1959 </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Syria </td>
   <td style="text-align:left;"> One party Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tunisia </td>
   <td style="text-align:left;"> One party Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1975 </td>
   <td style="text-align:right;"> 1978 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Venezuela </td>
   <td style="text-align:left;"> Military Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1948 </td>
   <td style="text-align:right;"> 1957 </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Yemen (Arab Republic of Yemen) </td>
   <td style="text-align:left;"> Monarchy-Transition </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1947 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
</tbody>
</table>

The following are especially troublesome, since the multiple categories do not make sense:


```r
print(kable(kailitz.yearly %>% 
        filter(grepl("-",combined_regime)) %>%
        group_by(country_name) %>%
        arrange(country_name,year) %>%
        group_by(combined_regime, add=TRUE) %>%
        summarise(min = min(year), max = max(year), n = n()) %>%
        filter(grepl("democracy",combined_regime, ignore.case=TRUE))))
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> country_name </th>
   <th style="text-align:left;"> combined_regime </th>
   <th style="text-align:right;"> min </th>
   <th style="text-align:right;"> max </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Colombia </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1947 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cuba </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1951 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Honduras </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1957 </td>
   <td style="text-align:right;"> 1962 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Niger </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1963 </td>
   <td style="text-align:right;"> 1967 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Philippines </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1971 </td>
   <td style="text-align:right;"> 26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Philippines </td>
   <td style="text-align:left;"> Liberal Democracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Seychelles </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Seychelles </td>
   <td style="text-align:left;"> Liberal Democracy-Transition </td>
   <td style="text-align:right;"> 1976 </td>
   <td style="text-align:right;"> 1976 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Somalia </td>
   <td style="text-align:left;"> Liberal Democracy-Transition </td>
   <td style="text-align:right;"> 1960 </td>
   <td style="text-align:right;"> 1968 </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sri Lanka (Ceylon) </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 1960 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 51 </td>
  </tr>
</tbody>
</table>

I have constructed the index to classify a country as "democratic" only if it is not also classified as a non-democratic regime as well. Here are the index counts for each regime type:


```r
print(kable(kailitz.yearly %>%
        count(kailitz_binary,kailitz_tri,combined_regime)))
```

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> kailitz_binary </th>
   <th style="text-align:right;"> kailitz_tri </th>
   <th style="text-align:left;"> combined_regime </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Communist Ideocracy </td>
   <td style="text-align:right;"> 788 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Communist Ideocracy-Electoral Autocracy </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Communist Ideocracy-State Failure or Occupation </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Communist Ideocracy-Transition </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Electoral Autocracy-Military Autocracy </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Electoral Autocracy-One party Autocracy </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Electoral Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Electoral Autocracy-State Failure or Occupation </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Electoral Autocracy-Transition </td>
   <td style="text-align:right;"> 18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Liberal Democracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Liberal Democracy-Transition </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Military Autocracy </td>
   <td style="text-align:right;"> 570 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Military Autocracy-One party Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Military Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Military Autocracy-State Failure or Occupation </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Military Autocracy-Transition </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Monarchy </td>
   <td style="text-align:right;"> 987 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Monarchy-State Failure or Occupation </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Monarchy-Transition </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> One party Autocracy </td>
   <td style="text-align:right;"> 486 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> One party Autocracy-Personalist Autocracy </td>
   <td style="text-align:right;"> 17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Personalist Autocracy </td>
   <td style="text-align:right;"> 463 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Personalist Autocracy-State Failure or Occupation </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Personalist Autocracy-Transition </td>
   <td style="text-align:right;"> 20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> State Failure or Occupation </td>
   <td style="text-align:right;"> 245 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> State Failure or Occupation-Transition </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> Transition </td>
   <td style="text-align:right;"> 319 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> Electoral Autocracy </td>
   <td style="text-align:right;"> 1477 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> Electoral Autocracy-Liberal Democracy </td>
   <td style="text-align:right;"> 111 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> Liberal Democracy </td>
   <td style="text-align:right;"> 3955 </td>
  </tr>
</tbody>
</table>

# LIED

This is the Lexical Index of Democracy described in Skaaning,  Gerring, and Bartusevicius 2015 (version 3, updated to 2015). 

## Coverage


```r
data <- democracy_long %>% filter(variable == "lied")

temporal_coverage(data)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/lied_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/lied_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),binwidth=1) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/lied_distribution-1.png)

# Magaloni

This is a measure of democracy derived from the authoritarian regimes dataset in Magaloni, Chu, and Min 2013. The original dataset has been extended beyond 1950 using the information encoded in the `duration_nr` variable of the original dataset, which provides information about the start date of each regime. 

## Coverage


```r
data <- democracy_long %>% filter(variable == "magaloni_democ_binary")

temporal_coverage(data) +
  geom_vline(xintercept = 1950) +
  annotate("text", label = "Limit of original dataset", x = 1950,y = 100, angle=90)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/magaloni_extended_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/magaloni_extended_coverage-2.png)

## Distribution

One change has been made (Pakistan 1971/1972 appears to have been misclassified as a democracy).

Note `magaloni_regime_tri` identifies as "hybrid" (middle level) all multiparty autocracies.


```r
data <- democracy_long %>% filter(variable %in% c("magaloni_democ_binary","magaloni_regime_tri"))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/magaloni_distribution-1.png)

# Mainwaring

This is the dataset in Mainwaring, Brinks, and Perez Linan 2008.

## Coverage


```r
data <- democracy_long %>% filter(variable == "mainwaring")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/mainwaring_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/mainwaring_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/mainwaring_distribution-1.png)

# Munck

This is the dataset in Munck 2009. Taken from Pemstein, Meserve, and Melton 2013.

## Coverage


```r
data <- democracy_long %>% filter(variable == "munck_pmm")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/munck_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/munck_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/munck_distribution-1.png)

```r
ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/munck_distribution-2.png)

# PACL/ACLP/DD

This is the dataset described in Cheibub, Gandhi, and Vreeland 2010.

## Coverage


```r
data <- democracy_long %>% filter(variable == "pacl")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/pacl_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/pacl_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years", x="") +
  facet_wrap(~variable, ncol=2) 
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/pacl_distribution-1.png)

# PEPS

This is the dataset described in Moon et al 2006. 

## Coverage

The `democracy` file contains seven variables from this dataset: `PEPS1i`, `PEPS2i`, `PEPS1q`, `PEPS2q`, `PEPS1v`,`PEPS2v`, and `Polity3`, a cleaned up version of the `polity2` variable in the Polity IV data. The `PEPS*` variables are constructed from `Polity3` and a participation variable derived either from Vanhanen's population and raw participation data (variables ending in `*v`) or from voting turnout data from IDEA (variables ending in `q` or `i`).


```r
data <- democracy_long %>% filter(variable %in% c("PEPS1i","PEPS2i","PEPS1q","PEPS2q","PEPS1v","PEPS2v","Polity3"))

data <- left_join(panel,data) 
```

```
## Joining by: c("country_name", "year")
```

```r
data <- data %>% group_by(variable,year, add=TRUE) %>% count_(vars = c("year","in_system","variable"))

ggplot(data =  data, aes(x=year,fill = in_system, y = n)) + 
    geom_bar(stat = "identity") +
    theme_bw() +
    theme(legend.position = "bottom") +
    labs(fill = "In G&W system of states", y = "Number of states or territories\nin each year of `democracy` panel") +
    ggtitle("Temporal coverage \nwithin the `democracy` dataset") + 
  facet_wrap(~variable) 
```

![](Spatial_and_temporal_coverage_files/figure-html/peps_coverage-1.png)

```r
data <- democracy_long %>% filter(variable %in% c("PEPS1i","PEPS2i","PEPS1q","PEPS2q","PEPS1v","PEPS2v"))

spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/peps_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value),binwidth=1) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years", x="") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/peps_distribution-1.png)

```r
library(GGally)
ggcorr(data = democracy %>% select(PEPS1i:PEPS2v), label=TRUE,label_round=3) + scale_fill_gradient2(midpoint = 0.7)
```

```
## Scale for 'fill' is already present. Adding another scale for 'fill',
## which will replace the existing scale.
```

![](Spatial_and_temporal_coverage_files/figure-html/peps_distribution-2.png)

## Known problems

The `Polity3` variable is different from the `polity2` variable in the following cases, mostly due to the different way in which Moon et al recode transitional periods, but in some cases due to revisions in the underlying Polity IV dataset since 2006:


```r
print(kable(democracy %>%
        filter(Polity3 != polity2) %>%
        group_by(country_name,Polity3,polity2,polity) %>%
        summarise(years = min(year), max = max(year), n = n())))
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> country_name </th>
   <th style="text-align:right;"> Polity3 </th>
   <th style="text-align:right;"> polity2 </th>
   <th style="text-align:right;"> polity </th>
   <th style="text-align:right;"> years </th>
   <th style="text-align:right;"> max </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -77 </td>
   <td style="text-align:right;"> 1978 </td>
   <td style="text-align:right;"> 1978 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Albania </td>
   <td style="text-align:right;"> -9 </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Albania </td>
   <td style="text-align:right;"> -9 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -77 </td>
   <td style="text-align:right;"> 1939 </td>
   <td style="text-align:right;"> 1944 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Angola </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Angola </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Angola </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Angola </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Argentina </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1956 </td>
   <td style="text-align:right;"> 1956 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Austria </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1933 </td>
   <td style="text-align:right;"> 1933 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Austria </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bhutan </td>
   <td style="text-align:right;"> -8 </td>
   <td style="text-align:right;"> -10 </td>
   <td style="text-align:right;"> -10 </td>
   <td style="text-align:right;"> 1953 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bolivia </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1952 </td>
   <td style="text-align:right;"> 1952 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bolivia </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1955 </td>
   <td style="text-align:right;"> 1955 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Botswana </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1969 </td>
   <td style="text-align:right;"> 1986 </td>
   <td style="text-align:right;"> 18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Botswana </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1987 </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Botswana </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1932 </td>
   <td style="text-align:right;"> 1932 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bulgaria </td>
   <td style="text-align:right;"> -8 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1944 </td>
   <td style="text-align:right;"> 1944 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bulgaria </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bulgaria </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1934 </td>
   <td style="text-align:right;"> 1934 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burundi </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cambodia (Kampuchea) </td>
   <td style="text-align:right;"> -8 </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cambodia (Kampuchea) </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1988 </td>
   <td style="text-align:right;"> 1988 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cambodia (Kampuchea) </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cambodia (Kampuchea) </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cambodia (Kampuchea) </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chad </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1984 </td>
   <td style="text-align:right;"> 1984 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chad </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1978 </td>
   <td style="text-align:right;"> 1978 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chad </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -77 </td>
   <td style="text-align:right;"> 1979 </td>
   <td style="text-align:right;"> 1983 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chile </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1924 </td>
   <td style="text-align:right;"> 1924 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> China </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1913 </td>
   <td style="text-align:right;"> 1913 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Comoros </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -77 </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Croatia </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cuba </td>
   <td style="text-align:right;"> -8 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1960 </td>
   <td style="text-align:right;"> 1960 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Czechoslovakia </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -77 </td>
   <td style="text-align:right;"> 1968 </td>
   <td style="text-align:right;"> 1968 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Denmark </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1904 </td>
   <td style="text-align:right;"> 1904 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Denmark </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1905 </td>
   <td style="text-align:right;"> 1905 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Denmark </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1906 </td>
   <td style="text-align:right;"> 1906 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Denmark </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1909 </td>
   <td style="text-align:right;"> 1909 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Denmark </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1910 </td>
   <td style="text-align:right;"> 1910 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Denmark </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1911 </td>
   <td style="text-align:right;"> 1911 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dominican Republic </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -77 </td>
   <td style="text-align:right;"> 1861 </td>
   <td style="text-align:right;"> 1864 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Estonia </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Estonia </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fiji </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> France </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -8 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1860 </td>
   <td style="text-align:right;"> 1860 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> France </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1871 </td>
   <td style="text-align:right;"> 1871 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guinea-Bissau </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -77 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guinea-Bissau </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Haiti </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hungary </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1918 </td>
   <td style="text-align:right;"> 1918 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hungary </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hungary </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Indonesia </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Iran (Persia) </td>
   <td style="text-align:right;"> -9 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1979 </td>
   <td style="text-align:right;"> 1979 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Iran (Persia) </td>
   <td style="text-align:right;"> -8 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1980 </td>
   <td style="text-align:right;"> 1980 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Iran (Persia) </td>
   <td style="text-align:right;"> -8 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1921 </td>
   <td style="text-align:right;"> 1921 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Iran (Persia) </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1924 </td>
   <td style="text-align:right;"> 1924 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Iran (Persia) </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1923 </td>
   <td style="text-align:right;"> 1981 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Iran (Persia) </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1922 </td>
   <td style="text-align:right;"> 1922 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Italy/Sardinia </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> 1861 </td>
   <td style="text-align:right;"> 1861 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Italy/Sardinia </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Italy/Sardinia </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Italy/Sardinia </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1947 </td>
   <td style="text-align:right;"> 1947 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Korea, People's Republic of </td>
   <td style="text-align:right;"> -9 </td>
   <td style="text-align:right;"> -10 </td>
   <td style="text-align:right;"> -10 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laos </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1974 </td>
   <td style="text-align:right;"> 1974 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laos </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1973 </td>
   <td style="text-align:right;"> 1973 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lesotho </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -77 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lesotho </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lesotho </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lesotho </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Liberia </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Luxembourg </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> 1879 </td>
   <td style="text-align:right;"> 1879 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Luxembourg </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1919 </td>
   <td style="text-align:right;"> 1919 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Malawi </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Malawi </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Malawi </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mali </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mexico </td>
   <td style="text-align:right;"> -8 </td>
   <td style="text-align:right;"> -9 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1879 </td>
   <td style="text-align:right;"> 1879 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mexico </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -8 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1878 </td>
   <td style="text-align:right;"> 1878 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Morocco </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1961 </td>
   <td style="text-align:right;"> 1962 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Morocco </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> 1963 </td>
   <td style="text-align:right;"> 1964 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mozambique </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Niger </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Papua New Guinea </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1975 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1919 </td>
   <td style="text-align:right;"> 1919 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1932 </td>
   <td style="text-align:right;"> 1932 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> 1948 </td>
   <td style="text-align:right;"> 1949 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1979 </td>
   <td style="text-align:right;"> 1979 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> 1962 </td>
   <td style="text-align:right;"> 1962 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> 1950 </td>
   <td style="text-align:right;"> 1955 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1956 </td>
   <td style="text-align:right;"> 1961 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Poland </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1946 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Poland </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1945 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Portugal </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1820 </td>
   <td style="text-align:right;"> 1821 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Portugal </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1833 </td>
   <td style="text-align:right;"> 1833 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rumania </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1940 </td>
   <td style="text-align:right;"> 1940 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rumania </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Russia (Soviet Union) </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Russia (Soviet Union) </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Russia (Soviet Union) </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rwanda </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Serbia </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1868 </td>
   <td style="text-align:right;"> 1868 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sierra Leone </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sri Lanka (Ceylon) </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sweden </td>
   <td style="text-align:right;"> -8 </td>
   <td style="text-align:right;"> -9 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1811 </td>
   <td style="text-align:right;"> 1811 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sweden </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1908 </td>
   <td style="text-align:right;"> 1908 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sweden </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1915 </td>
   <td style="text-align:right;"> 1915 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tanzania/Tanganyika </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> 1961 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tanzania/Tanganyika </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tanzania/Tanganyika </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Thailand </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1934 </td>
   <td style="text-align:right;"> 1934 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Togo </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Uganda </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1966 </td>
   <td style="text-align:right;"> 1966 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ukraine </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ukraine </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ukraine </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Yugoslavia </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1944 </td>
   <td style="text-align:right;"> 1944 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zambia </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zimbabwe (Rhodesia) </td>
   <td style="text-align:right;"> -7 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zimbabwe (Rhodesia) </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> -4 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zimbabwe (Rhodesia) </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zimbabwe (Rhodesia) </td>
   <td style="text-align:right;"> -5 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> -3 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zimbabwe (Rhodesia) </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> -88 </td>
   <td style="text-align:right;"> 1979 </td>
   <td style="text-align:right;"> 1979 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Zimbabwe (Rhodesia) </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1980 </td>
   <td style="text-align:right;"> 1982 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
</tbody>
</table>

# PITF

These are the scores used in Goldstone et al 2010 and (in binary form) in Taylor and Ulfelder 2015. 

## Coverage


```r
data <- democracy_long %>% filter(variable == "pitf")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/pitf_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/pitf_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_bar(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years", x="") +
  facet_wrap(~variable, ncol=2) 
```

![](Spatial_and_temporal_coverage_files/figure-html/pitf_distribution-1.png)

```r
data <- democracy_long %>% filter(variable == "pitf_binary")

ggplot(data = data) +
  geom_bar(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years", x="") +
  facet_wrap(~variable, ncol=2) 
```

![](Spatial_and_temporal_coverage_files/figure-html/pitf_distribution-2.png)

# Polity

These are variables from the Polity IV dataset in country-year format, updated to 2014 (Marshall, Gurr, and Jaggers 2012). 

## Coverage



```r
data <- democracy_long %>% filter(variable == "polity")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/polity_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/polity_coverage-2.png)

## Distribution


```r
data <- democracy_long %>% filter(variable == "polity2")

ggplot(data = data) +
  geom_histogram(aes(x=value),binwidth=1) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

![](Spatial_and_temporal_coverage_files/figure-html/polity_distribution-1.png)

# Polyarchy

The dataset from Coppedge and Reinicke 1991, revised in 2003-2006 with a new "contestation" measure. 

## Coverage


```r
data <- democracy_long %>% filter(variable == "polyarchy_reversed")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/polyarchy_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/polyarchy_coverage-2.png)

## Distribution


```r
data <- democracy_long %>% filter(variable %in% c("polyarchy_reversed","polyarchy_contestation"))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/polyarchy_distribution-1.png)

```r
print(kable(democracy %>% 
        filter(!is.na(polyarchy_reversed)) %>% 
        count(polyarchy_reversed,polyarchy_contestation),
      caption = "Relationship between reversed polyarchy measure and polyarchy contestation measure"))
```

```
## <table>
## <caption>Relationship between reversed polyarchy measure and polyarchy contestation measure</caption>
##  <thead>
##   <tr>
##    <th style="text-align:right;"> polyarchy_reversed </th>
##    <th style="text-align:right;"> polyarchy_contestation </th>
##    <th style="text-align:right;"> n </th>
##   </tr>
##  </thead>
## <tbody>
##   <tr>
##    <td style="text-align:right;"> 0 </td>
##    <td style="text-align:right;"> 1 </td>
##    <td style="text-align:right;"> 35 </td>
##   </tr>
##   <tr>
##    <td style="text-align:right;"> 1 </td>
##    <td style="text-align:right;"> 2 </td>
##    <td style="text-align:right;"> 12 </td>
##   </tr>
##   <tr>
##    <td style="text-align:right;"> 2 </td>
##    <td style="text-align:right;"> 2 </td>
##    <td style="text-align:right;"> 24 </td>
##   </tr>
##   <tr>
##    <td style="text-align:right;"> 3 </td>
##    <td style="text-align:right;"> 3 </td>
##    <td style="text-align:right;"> 22 </td>
##   </tr>
##   <tr>
##    <td style="text-align:right;"> 4 </td>
##    <td style="text-align:right;"> 4 </td>
##    <td style="text-align:right;"> 17 </td>
##   </tr>
##   <tr>
##    <td style="text-align:right;"> 5 </td>
##    <td style="text-align:right;"> 4 </td>
##    <td style="text-align:right;"> 16 </td>
##   </tr>
##   <tr>
##    <td style="text-align:right;"> 5 </td>
##    <td style="text-align:right;"> 5 </td>
##    <td style="text-align:right;"> 10 </td>
##   </tr>
##   <tr>
##    <td style="text-align:right;"> 6 </td>
##    <td style="text-align:right;"> 5 </td>
##    <td style="text-align:right;"> 33 </td>
##   </tr>
##   <tr>
##    <td style="text-align:right;"> 7 </td>
##    <td style="text-align:right;"> 6 </td>
##    <td style="text-align:right;"> 19 </td>
##   </tr>
##   <tr>
##    <td style="text-align:right;"> 8 </td>
##    <td style="text-align:right;"> 7 </td>
##    <td style="text-align:right;"> 21 </td>
##   </tr>
##   <tr>
##    <td style="text-align:right;"> 9 </td>
##    <td style="text-align:right;"> 8 </td>
##    <td style="text-align:right;"> 35 </td>
##   </tr>
##   <tr>
##    <td style="text-align:right;"> 10 </td>
##    <td style="text-align:right;"> 9 </td>
##    <td style="text-align:right;"> 113 </td>
##   </tr>
## </tbody>
## </table>
```

# Political Regime Change (PRC)/Gasiorowski dataset

The dataset first described in Gasiorowski 1996, and updated and revised in Reich 2002. 

## Coverage


```r
data <- democracy_long %>% filter(variable == "prc")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/prc_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/prc_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/prc_distribution-1.png)

# PIPE

A constructed regime variable from Przeworski 2013 (the Political Institutions and Political Events (PIPE) Data Set).

## Coverage


```r
data <- democracy_long %>% filter(variable == "przeworski")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/pipe_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/pipe_coverage-2.png)

## Distribution

It is not clear that this index is correctly constructed, given the confusing documentation in the original dataset. Use with care.


```r
ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/pipe_distribution-1.png)

# Svolik

This uses a measure of democracy derived from the authoritarian regime dataset in Svolik 2012. The original data is extended to before 1946 using the information encoded in the `o_startdate` variable of the original dataset, which provides information for the start dates of some authoritarian regimes.

## Coverage


```r
data <- democracy_long %>% filter(variable == "svolik")

temporal_coverage(data) +
  geom_vline(xintercept = 1946) +
  annotate("text", label = "Limit of original dataset", x = 1946,y = 100, angle=90)
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/svolik_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/svolik_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/svolik_distribution-1.png)

# Ulfelder

The dataset in Ulfelder 2012. 

## Coverage


```r
data <- democracy_long %>% filter(variable == "ulfelder")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/ulfelder_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/ulfelder_coverage-2.png)

## Distribution


```r
ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/ulfelder_distribution-1.png)

# UTIP

A measure of democracy from the regime type dataset described in Hsu 2008. This dataset identifies three types of democracies: "social democracies", "conservative democracies", and "one party democracies." "One party democracies" are poorly documented, but seem to be equivalent to multiparty autocracies. `utip_dichotomous_strict` identifies as democracies only social or conservative democracies; `utip_dichotomous` also identifies as democracies those "one party democracies"; and `utip_trichotomous` assumes that "one party democracies" are hybrid regimes between democracy and non-democracy.

## Coverage


```r
data <- democracy_long %>% filter(variable == "utip_dichotomous")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/utip_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/utip_coverage-2.png)

## Distribution


```r
data <- democracy_long %>% filter(variable %in% c("utip_dichotomous_strict","utip_dichotomous","utip_trichotomous"))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/utip_distribution-1.png)

# Vanhanen

This is the dataset in Vanhanen 2012. 

## Coverage


```r
data <- democracy_long %>% filter(variable == "vanhanen_democratization")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/vanhanen_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/vanhanen_coverage-2.png)

## Distribution


```r
data <- democracy_long %>% filter(variable %in% c("vanhanen_democratization","vanhanen_participation","vanhanen_competition"))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/vanhanen_distribution-1.png)

```r
ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)  
```

![](Spatial_and_temporal_coverage_files/figure-html/vanhanen_distribution-2.png)

# V-Dem

This is a selection of the major democracy indexes from version 6 of the V-Dem dataset (`v2x*` variables) (Coppedge et al. 2016).

## Coverage

Most of the not in-system country-years in the main dataset are from V-Dem.


```r
data <- democracy_long %>% filter(variable == "v2x_polyarchy")

temporal_coverage(data) 
```

```
## Joining by: c("country_name", "year")
```

![](Spatial_and_temporal_coverage_files/figure-html/vdem_coverage-1.png)

```r
spatial_coverage(data)
```

![](Spatial_and_temporal_coverage_files/figure-html/vdem_coverage-2.png)

## Distribution


```r
data <- democracy_long %>% filter(grepl("v2x",variable))

ggplot(data = data) +
  geom_histogram(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Country-years") +
  facet_wrap(~variable, ncol=2)
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](Spatial_and_temporal_coverage_files/figure-html/vdem_distribution-1.png)

```r
ggplot(data = data) +
  geom_density(aes(x=value)) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = "Density") +
  facet_wrap(~variable, ncol=2)  
```

![](Spatial_and_temporal_coverage_files/figure-html/vdem_distribution-2.png)

```r
ggcorr(data = democracy %>% select(v2x_api:v2x_polyarchy), label=TRUE,label_round=3, hjust=1) + scale_fill_gradient2(midpoint = 0.7)
```

```
## Scale for 'fill' is already present. Adding another scale for 'fill',
## which will replace the existing scale.
```

![](Spatial_and_temporal_coverage_files/figure-html/vdem_distribution-3.png)

# References

Arat, Zehra F. 1991. Democracy and human rights in developing countries.
Boulder: Lynne Rienner Publishers.

Bernhard, Michael Timothy Nordstrom, and Christopher Reenock, "Economic
Performance, Institutional Intermediation and Democratic Breakdown,"
Journal of Politics 63:3 (2001), pp. 775-803. Data and coding description
available at http://users.clas.ufl.edu/bernhard/content/data/data.htm

Boix, Carles, Michael Miller, and Sebastian Rosato. 2012. A Complete Data
Set of Political Regimes, 1800-2007. Comparative Political Studies 46 (12):
1523-1554. Original data available at
https://sites.google.com/site/mkmtwo/democracy-v2.0.dta?attredirects=0


Bollen, Kenneth A. 2001. "Cross-National Indicators of Liberal Democracy,
1950-1990." 2nd ICPSR version. Chapel Hill, NC: University of North
Carolina, 1998. Ann Arbor, MI: Inter-university Consortium for Political
and Social Research, 2001. Original data available at
http://webapp.icpsr.umich.edu/cocoon/ICPSR-STUDY/02532.xml.

Bowman, Kirk, Fabrice Lehoucq, and James Mahoney. 2005. Measuring Political
Democracy: Case Expertise, Data Adequacy, and Central America. Comparative
Political Studies 38 (8): 939-970.
http://cps.sagepub.com/content/38/8/939. Data available at
http://www.blmdemocracy.gatech.edu/.

Cheibub, Jose Antonio, Jennifer Gandhi, and James Raymond Vreeland. 2010.
"Democracy and Dictatorship Revisited." Public Choice. 143(1):67-101.
Original data available at
https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited.

Coppedge, Michael, John Gerring, Staffan I. Lindberg, Svend-Erik Skaaning,
and Jan Teorell, with David Altman, Michael Bernhard, M. Steven Fish, Adam
Glynn, Allen Hicken, Carl Henrik Knutsen, Kelly McMann, Pamela Paxton,
Daniel Pemstein, Jeffrey Staton, Brigitte Zimmerman, Frida Andersson,
Valeriya Mechkova, Farhad Miri. 2015. V-Dem Codebook v5. Varieties of
Democracy (V-Dem) Project. Original data available at
https://v-dem.net/en/data/.

Coppedge, Michael and Wolfgang H. Reinicke. 1991. Measuring Polyarchy. In
On Measuring Democracy: Its Consequences and Concomitants, ed. Alex
Inkeles. New Brunswuck, NJ: Transaction pp. 47-68.

Doorenspleet, Renske. 2000. Reassessing the Three Waves of Democratization.
World Politics 52 (03): 384-406. DOI: 10.1017/S0043887100016580.
http://dx.doi.org/10.1017/S0043887100016580.

Economist Intelligence Unit. 2012. Democracy Index 2012: Democracy at a
Standstill.

Freedom House. 2015. "Freedom in the World." Original data available at
http://www.freedomhouse.org.

Gasiorowski, Mark J. 1996. "An Overview of the Political Regime Change
Dataset." Comparative Political Studies 29(4):469-483.

Geddes, Barbara, Joseph Wright, and Erica Frantz. 2014. Autocratic
Breakdown and Regime Transitions: A New Data Set. Perspectives on Politics
12 (1): 313-331. Original data available at
http://dictators.la.psu.edu/.

Gleditsch, Kristian S. & Michael D. Ward. 1999. "Interstate System
Membership: A Revised List of the Independent States since 1816."
International Interactions 25: 393-413. The list can be found at
http://privatewww.essex.ac.uk/~ksg/statelist.html

Goldstone, Jack, Robert Bates, David Epstein, Ted Gurr, Michael Lustik,
Monty Marshall, Jay Ulfelder, and Mark Woodward. 2010. A Global Model for
Forecasting Political Instability. American Journal of Political Science 54
(1): 190-208. DOI:10.1111/j.1540-5907.2009.00426.x

Hadenius, Axel. 1992. Democracy and Development. Cambridge: Cambridge
University Press.

Hadenius, Axel & Jan Teorell. 2007. "Pathways from Authoritarianism", Journal
of Democracy 18(1): 143-156.

Hsu, Sara "The Effect of Political Regimes on Inequality, 1963-2002," UTIP
Working Paper No. 53 (2008),
http://utip.gov.utexas.edu/papers/utip_53.pdf. Data available for
download at http://utip.gov.utexas.edu/data/.

Kailitz, Steffen. 2013. Classifying political regimes revisited: legitimation
and durability. Democratization 20 (1): 39-60. Original data available at
http://dx.doi.org/10.1080/13510347.2013.738861.

Mainwaring, Scott, Daniel Brinks, and Anibal Perez Linan. 2008. "Political
Regimes in Latin America, 1900-2007." Original data available from
http://kellogg.nd.edu/scottmainwaring/Political_Regimes.pdf.

Magaloni, Beatriz, Jonathan Chu, and Eric Min. 2013. Autocracies of the
World, 1950-2012 (Version 1.0). Dataset, Stanford University. Original data
and codebook available at
http://cddrl.fsi.stanford.edu/research/autocracies_of_the_world_dataset/

Marshall, Monty G., Ted Robert Gurr, and Keith Jaggers. 2012. "Polity IV:
Political Regime Characteristics and Transitions, 1800-2012." Updated to
2015. Original data available from
http://www.systemicpeace.org/polity/polity4.htm.

Moon, Bruce E., Jennifer Harvey Birdsall, Sylvia Ceisluk, Lauren M.
Garlett, Joshua J. Hermias, Elizabeth Mendenhall, Patrick D. Schmid, and
Wai Hong Wong (2006) "Voting Counts: Participation in the Measurement of
Democracy" Studies in Comparative International Development 42, 2 (Summer,
2006). The complete dataset is available here:
http://www.lehigh.edu/~bm05/democracy/Obtain_data.htm.

Munck, Gerardo L. 2009. Measuring Democracy: A Bridge Between Scholarship
and Politics. Baltimore: Johns Hopkins University Press.

Pemstein, Daniel, Stephen Meserve, and James Melton. 2010. Democratic
Compromise: A Latent Variable Analysis of Ten Measures of Regime Type.
Political Analysis 18 (4): 426-449.

Pemstein, Daniel, Stephen A. Meserve, and James Melton. 2013. "Replication
data for: Democratic Compromise: A Latent Variable Analysis of Ten Measures
of Regime Type." In: Harvard Dataverse.
http://hdl.handle.net/1902.1/PMM

Przeworski, Adam et al. 2013. Political Institutions and Political Events
(PIPE) Data Set. Department of Politics, New York University.
https://sites.google.com/a/nyu.edu/adam-przeworski/home/data

Reich, G. 2002. Categorizing Political Regimes: New Data for Old Problems.
Democratization 9 (4): 1-24.
http://www.tandfonline.com/doi/pdf/10.1080/714000289.

Skaaning, Svend-Erik, John Gerring, and Henrikas Bartusevicius. 2015. A
Lexical Index of Electoral Democracy. Comparative Political Studies 48
(12): 1491-1525. Original data available from
http://thedata.harvard.edu/dvn/dv/skaaning.

Svolik, Milan. 2012. The Politics of Authoritarian Rule. Cambridge and New
York: Cambridge University Press. Original data available from
http://campuspress.yale.edu/svolik/the-politics-of-authoritarian-rule/.

Taylor, Sean J. and Ulfelder, Jay, A Measurement Error Model of Dichotomous
Democracy Status (May 20, 2015). Available at SSRN:
http://ssrn.com/abstract=2726962 or
http://dx.doi.org/10.2139/ssrn.2726962

Ulfelder, Jay. 2012. "Democracy/Autocracy Data Set." In: Harvard Dataverse.
http://hdl.handle.net/1902.1/18836.

Vanhanen, Tatu. 2012. "FSD1289 Measures of Democracy 1810-2012." Original
data available from
http://www.fsd.uta.fi/english/data/catalogue/FSD1289/meF1289e.html

Wahman, Michael, Jan Teorell, and Axel Hadenius. 2013. Authoritarian regime
types revisited: updated data in comparative perspective. Contemporary
Politics 19 (1): 19-34.
