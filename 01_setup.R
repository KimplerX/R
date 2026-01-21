
dir.create("data")
dir.create("data_output")
dir.create("fig_output")


download.file("https://raw.githubusercontent.com/datacarpentry/r-socialsci/main/episodes/data/SAFI_clean.csv","data/SAFI_clean.csv", mode = "wb")

install.packages("tidyverse")