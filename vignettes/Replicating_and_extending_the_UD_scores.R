## ---- include=FALSE------------------------------------------------------
library(knitr)
opts_chunk$set(echo=TRUE)

## ------------------------------------------------------------------------
library(QuickUDS)
library(mirt)

indexes <- names(democracy)[grep("pmm",names(democracy))]
indexes # The measures of democracy used to generate the 2011 release of the UDS
data <- prepare_democracy(indexes)

## ------------------------------------------------------------------------
replication_2011_model <- mirt(data[ ,  indexes], model = 1, 
                               itemtype = "graded", SE = TRUE, verbose = FALSE)

## ------------------------------------------------------------------------
replication_2011_model@time

## ------------------------------------------------------------------------
replication_2011_model <- democracy_model(data, indexes, verbose = FALSE)

## ------------------------------------------------------------------------
replication_2011_model
summary(replication_2011_model)

## ------------------------------------------------------------------------
replication_2011_scores <-  fscores(replication_2011_model, full.scores = TRUE, full.scores.SE = TRUE)
# Not a data frame:
str(replication_2011_scores)

replication_2011_scores <- democracy_scores(replication_2011_model)

# A data frame with confidence intervals:
head(replication_2011_scores)

# We then bind these scores to the transformed data to associate them with the right country-years
replication_2011_scores <- cbind(data,replication_2011_scores)

## ------------------------------------------------------------------------
library(dplyr)
comparison <- left_join(replication_2011_scores, uds_2011, by=c("country_name","year","GWn"))

Hmisc::rcorr(comparison %>% select(z1,mean) %>% as.matrix())

## ------------------------------------------------------------------------
indexes <- c("arat_pmm","blm","bmr_democracy","bollen_pmm","doorenspleet","eiu","freedomhouse",
             "gwf","hadenius_pmm","kailitz_tri","lied","mainwaring","munck_pmm","pacl",
             "polity2","polyarchy_pmm","prc","svolik","ulfelder",
             "v2x_polyarchy","vanhanen_democratization","wahman_teorell_hadenius")
data <- prepare_democracy(indexes)
extended_model <- democracy_model(data,indexes, verbose=FALSE)
extended_scores <- democracy_scores(extended_model)
extended_scores <- bind_cols(data,extended_scores)
extended_model
extended_model@time
extended_scores %>% select(country_name,GWn,cown,year,z1,se.z1,pct025,pct975)

## ------------------------------------------------------------------------
extended_model <- democracy_model(data,indexes, verbose=FALSE, technical = list(NCYCLES = 2500)) 

## ---- fig.height=8, fig.width=7------------------------------------------
countries <- c("United States of America","United Kingdom","Argentina","Chile","Venezuela","Spain")

data <- bind_rows(extended_scores %>% mutate(version = "Extension"),
                  uds_2014 %>% rename(z1 = mean) %>% mutate(version = "PMM2014 release"))

data <- data %>% arrange(version,country_name,year) %>% filter(country_name %in% countries)

library(ggplot2)

ggplot(data = data, aes(x=year,y=z1,ymin = pct025,ymax = pct975, color = version, fill= version)) + 
  geom_path() + 
  geom_ribbon(alpha=0.2) + 
  theme_bw() + 
  labs(x = "Year", y = "Latent unified democracy scores,\nper year")  + 
  theme(legend.position="bottom") + 
  guides(color = guide_legend(ncol=1),fill = guide_legend(nrow=1)) + 
  facet_wrap(~country_name,ncol=2)  


## ---- fig.height=8, fig.width=7------------------------------------------
mean_ud_period <- mean(extended_scores$z1[ paste(extended_scores$country_name,extended_scores$year) 
                                           %in% paste(uds_2014$country_name,uds_2014$year) ])

# This is how much higher the extended scores are than the scores in UDS 2014 release,
# on average
mean_ud_period

extended_scores <- extended_scores %>% 
  mutate(adj.z1 = z1 - mean_ud_period, 
         adj.pct025 = pct025 - mean_ud_period, 
         adj.pct975 = pct975 - mean_ud_period)

data <- bind_rows(extended_scores %>% 
                    mutate(version = "Extension, adjusted mean"),
                  uds_2014 %>% 
                    rename(adj.z1 = mean, adj.pct975 = pct975, adj.pct025 = pct025) %>% 
                    mutate(version = "PMM2014 release"))

data <- data %>% arrange(version,country_name,year) %>% filter(country_name %in% countries)

library(ggplot2)

ggplot(data = data, aes(x=year,y=adj.z1,ymin = adj.pct025,ymax = adj.pct975, color = version, fill= version)) + 
  geom_path() + 
  geom_ribbon(alpha=0.2) + 
  theme_bw() + 
  labs(x = "Year", y = "Latent unified democracy scores,\nper year")  + 
  theme(legend.position="bottom") + 
  guides(color = guide_legend(ncol=1),fill = guide_legend(nrow=1)) + 
  facet_wrap(~country_name,ncol=2)  


## ------------------------------------------------------------------------
extended_scores <- match_to_uds(extended_scores, release = 2014)

## ------------------------------------------------------------------------
extended_scores <- extended_scores %>% mutate(index = pnorm(adj.z1), index.pct025 = pnorm(adj.pct025), index.pct975 = pnorm(adj.pct975))

## ---- fig.height=8, fig.width=7------------------------------------------
cutpoints_extended <- cutpoints(extended_model)

cutpoints_extended <- cutpoints_extended %>% filter(type != "a1")

cutpoints_extended <- left_join(cutpoints_extended,democracy_long %>% select(variable,index_type)  %>% distinct())

dichotomous_cutpoints <- cutpoints_extended %>% filter(index_type == "Dichotomous")

dichotomous_cutpoints <- mean(dichotomous_cutpoints$estimate)

extended_scores <- extended_scores %>% mutate(adj.z1 = z1 - dichotomous_cutpoints, 
                                        adj.pct025 = pct025 - dichotomous_cutpoints, 
                                        adj.pct975 = pct975 - dichotomous_cutpoints,
                                        index = pnorm(adj.z1),
                                        index.pct025 = pnorm(adj.pct025),
                                        index.pct975 = pnorm(adj.pct975))

ggplot(data = extended_scores %>% filter(country_name %in% countries), 
       aes(x=year,y=index,ymin = index.pct025,ymax = index.pct975)) + 
  geom_path() + 
  geom_ribbon(alpha=0.2) + 
  theme_bw() + 
  labs(x = "Year", y = "Latent unified democracy scores,\nper year\nconverted to 0-1 probability scale")  + 
  theme(legend.position="bottom") + 
  guides(color = guide_legend(ncol=1),fill = guide_legend(nrow=1)) + 
  geom_hline(yintercept=0.5,color="red") +
  facet_wrap(~country_name,ncol=2)  

## ---- fig.height=8, fig.width=7------------------------------------------
replication_2011_cutpoints <- cutpoints(replication_2011_model)
replication_2011_cutpoints

# We don't want to plot the discrimination parameter here, only the cutpoints
replication_2011_cutoffs <- replication_2011_cutpoints %>% filter(type != "a1") 

# We plot the "normalized" cutpoints ("estimate," in the same scale as the latent scores), 
# not the untransformed ones ("par")

ggplot(data = replication_2011_cutoffs, aes(x=variable,y = estimate, ymin = pct025,ymax=pct975))  + 
  theme_bw() + 
  labs(x="",y="Unified democracy level rater cutoffs") + 
  geom_point() + 
  geom_errorbar() + 
  geom_hline(yintercept =0, color="red") + 
  coord_flip()

# We can also plot discrimination parameters, which are in a different scale:
replication_2011_discrimination <- replication_2011_cutpoints %>% filter(type == "a1")

ggplot(data = replication_2011_discrimination, 
       aes(x=reorder(variable,par),y = par, ymin = CI_2.5,ymax=CI_97.5))  + 
  theme_bw() + 
  labs(x="",y="Discrimination parameter for each rater
       \n(higher value means fewer idiosyncratic errors relative to latent score)") + 
  geom_point() + 
  geom_errorbar() + 
  coord_flip()

# And we can plot item information curves for each rater:
replication_2011_info <- raterinfo(replication_2011_model)
replication_2011_info

ggplot(data = replication_2011_info, aes(x=theta,y=info)) + 
  geom_path() + 
  facet_wrap(~rater) + 
  theme_bw() + 
  labs(x="Latent democracy score",y = "Information") + 
  theme(legend.position="bottom")


## ------------------------------------------------------------------------
prob_more(replication_2011_scores, "United States of America","France", 2000)
prob_more(extended_scores, "United States of America","France", 2000)


## ------------------------------------------------------------------------
prob_more(replication_2011_scores, "United States of America","United States of America", c(2000,1953))
prob_more(extended_scores, "United States of America","United States of America", c(2000,1953))


## ------------------------------------------------------------------------
citation("QuickUDS")

