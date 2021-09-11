input_file=~/anki_downloads
anki_csv=~/anki_csv

prune_files() {
  rm -rf $input_file/*
  rm -rf $anki_csv/*
}

prune_files