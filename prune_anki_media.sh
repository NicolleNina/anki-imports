readonly INPUT_FILE=~/anki_downloads
readonly ANKI_CSV=~/anki_csv

prune_files() {
  rm -rf $INPUT_FILE/*
  rm -rf $ANKI_CSV/*
}

prune_files
