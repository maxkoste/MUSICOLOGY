# MUSICOLOGY

 - Album
what makes a succesfull album. I will look at some of the most iconic and top rated albums pulling data from the rolling stones top 500 list of albums and then comparing their characteristics to a similair list from the 2000s. 

We will check for features and similarities between succesfull albums that can be observed. This will be done by gathering data from Spotify from a selection of succesfull albums from the 70s and 60s. This will then be compared to the top albums of the 2000s also from the rolling stones. 

The first thing we do is to gather data from two playlist I created with old albums (released no later then 1980) that the rolling stones ranked as some of the best albums and one playlist with albums from 2010 - 2020, also ranked high by the rolling stones. Then we compare the general information we get from looking at the data to get some indication of any differences or similairites that can be found.


library(tidyverse)
library(spotifyr)

Sys.setenv(SPOTIFY_CLIENT_ID = 'bd931293a2ec4649a3069f6a137bd0be')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '1fdfce6c747048bbb3e0cdb4bb7596aa')

stones_old <- get_playlist_audio_features('spotify', '4M2hsYvNxtTQYYdJXM7nZf')
stones_new <- get_playlist_audio_features('spotify', '5O8ZKa73hlfLYXnRLbU1xk')

stones <- stones_old %>% mutate(playlist = "stones_old") %>%
  bind_rows(stones_new %>% mutate(playlist = "stones_new"))

stones_old %>% summarise(M = mean(danceability), SD = sd(danceability))
stones_new %>% summarise(M = mean(danceability), SD = sd(danceability))


first we take a look at the mean values and standard deviation for some of the common characteristics.


#stones new (instrumentalness)

       M    SD
   <dbl> <dbl>
1 0.0783 0.209



#stones old (instrumentalness)

      M    SD
  <dbl> <dbl>
1 0.124 0.257



#stones new danceability

     M    SD
  <dbl> <dbl>
1 0.558 0.157



#Stones_old danceability

      M    SD
  <dbl> <dbl>
1 0.502 0.145



#then i made a barplot to look at the acousticness between both playlists



 stones %>%
  ggplot(aes(x = tempo, y = instrumentalness)) + 
  geom_point() + 
  geom_smooth() + 
  facet_wrap('playlist')
<dbl>


stones %>%
  ggplot(aes(x=playlist, y = acousticness)) +
  geom_bar(stat="identity", fill="steelblue", width = 0.5)`



 ![barplot](barplot_acousticness.png)
 
 
 ![barplot2](instrumentalness.png)
 
 ![barplot4](liveness.png)
 
 Then I created a scatterplot to include some more dimensions of the data.
 
 ![energyvalence](Rplot.png)

 


 
in the latest graph we see that the loudest songs in our data set comes from the new playlist and the more quiet outliers on the loudness scale are simialir between both the new and the old, with the exeption of an more extreme outlier on the old playlist down by the bottom of the y axis. The newer songs also seems to be higher in danceablity being more clustered towards the end of the x-axis while the older songs are more centered on the x-axis. Alot of the more energetic/high in valence songs are also amongst the newer releases but there is not a big difference between the two.
 
 Stones_new (loudness)
 
      M    SD
  <dbl> <dbl>
1 -9.13  4.18

stones_old (loudness)

      M    SD
  <dbl> <dbl>
1 -10.1  3.64


The standard deviation is pretty high on both of these playlists when it comes to loudness. 

 
 




