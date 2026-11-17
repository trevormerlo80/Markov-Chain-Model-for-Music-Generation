#install.packages("music")
library(music)

#120BPM so each beat = 0.5 seconds
for (i in 1:16) {
  playChord(buildChord("E4", "minor"), duration = 2)
  Sys.sleep(1)
  playChord(buildChord("D4", "major"), duration = 0.5)
  Sys.sleep(0.25)
}
