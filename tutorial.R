library(tidyverse)
library(spotifyr)

# Set Spotify access variables (every time)

Sys.setenv(SPOTIFY_CLIENT_ID = 'bd931293a2ec4649a3069f6a137bd0be')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '1fdfce6c747048bbb3e0cdb4bb7596aa')

stones_old <- get_playlist_audio_features('spotify', '4M2hsYvNxtTQYYdJXM7nZf')
stones_new <- get_playlist_audio_features('spotify', '5O8ZKa73hlfLYXnRLbU1xk')


stones <- stones_old %>% mutate(playlist = "stones_old") %>%
  bind_rows(stones_new %>% mutate(playlist = "stones_new"))

stones %>% ggplot(aes(x = energy)) + geom_histogram(binwidth = 0.1)


