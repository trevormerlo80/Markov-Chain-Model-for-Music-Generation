#install.packages("music")
library(music)
library(stringr)

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
  print(paste0(bmr_chords[i], "4"))
  playChord(buildChord(paste0(bmr_chords[i], "4"), "major"), duration = 1)
  Sys.sleep(0.5)
}





