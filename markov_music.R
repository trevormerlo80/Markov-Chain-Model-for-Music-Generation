#install.packages("music")
library(music)
library(stringr)
library(tidyverse)

#120BPM so each beat = 0.5 seconds
for (i in 1:16) {
  playChord(buildChord("E4", "minor"), duration = 2)
  Sys.sleep(1)
  playChord(buildChord("D4", "major"), duration = 0.5)
  Sys.sleep(0.25)
}

#Message in a Bottle :)
for (i in 1:4) {
  playChord(buildChord("C#4", "minor"), duration = 1)
  Sys.sleep(0.5)
  playChord(buildChord("A3", "major"), duration = 1.5)
  Sys.sleep(0.75)
  playChord(buildChord("B3", "major"), duration = 1)
  Sys.sleep(0.5)
  playChord(buildChord("F#3", "minor"), duration = 1.5)
  Sys.sleep(0.75)
}


bad_moon_rising_chords <- read.csv("ccr_bmr_chords.txt")

bmr_chords <- bad_moon_rising_chords |> 
  str_extract_all("[A-Z]")

bmr_chords <- bmr_chords$ccr.bad.moon.rising.chords |> 
  str_extract_all("[A-Z]")

for (i in 1:58) {
  if (bmr_chords[i] == "D") {
    playChord(buildChord(paste0(bmr_chords[i], "4"), "major"), duration = 2)
    Sys.sleep(1)
  }
  
  if (bmr_chords[i] == "A") {
    playChord(buildChord(paste0(bmr_chords[i], "3"), "major"), duration = 1)
    Sys.sleep(0.5)
  }
  
  if (bmr_chords[i] == "G") {
    playChord(buildChord(paste0(bmr_chords[i], "4"), "major"), duration = 1)
    Sys.sleep(0.5)
  }
  
}


#With or Without you U2 - Repetitive 4beat D A Bm G
for (i in 1:16) {
  for (n in 1:4) {
    playChord(buildChord("D4", "major"), duration = 0.25)
    Sys.sleep(0.125)
  }
  
  for (n in 1:4) {
    playChord(buildChord("A3", "major"), duration = 0.25)
    Sys.sleep(0.125)
  }
  
  for (n in 1:4) {
    playChord(buildChord("B3", "minor"), duration = 0.25)
    Sys.sleep(0.125)
  }
  
  for (n in 1:4) {
    playChord(buildChord("G3", "major"), duration = 0.25)
    Sys.sleep(0.125)
  }
}

wowu_chords <- rep(c(
  rep(c("D4"), 4), 
  rep(c("A3"), 4), 
  rep(c("B3"), 4), 
  rep(c("G3"), 4)), 36)

wowu_bigrams <- data.frame(
  chord1 = wowu_chords[-length(wowu_chords)],
  chord2 = wowu_chords[-1]
)

wowu_bigrams |> 
  group_by(chord1, chord2) |> 
  count() |> 
  ungroup() |> 
  group_by(chord1) |> 
  mutate(prob = n/sum(n))


