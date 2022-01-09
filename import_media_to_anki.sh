#!/bin/bash

readonly INPUT_FILE=~/anki_downloads

# auto-create these if they don't exist
touch ~/.zshrc
mkdir -p $INPUT_FILE
mkdir -p ~/anki_csv

import_media() {
  local current_dir=$1

  for file in $current_dir/*;
  do
    if [ -d $file ]; then
      import_media $file
    elif [ -f $file ]; then
      transfer_to_anki $file
    fi
  done
  echo 'Done!'
}

unzip_media() {
  for file in $1/*;
  do
    if [[ $file == *.zip ]]; then
      echo 'unzipping:' $file
      unzip $file  -d $INPUT_FILE
    fi
  done
}

transfer_to_anki() {
  local transfer_file=$1

  if [[ $transfer_file != *.zip && $transfer_file != *.csv ]]; then
    echo "copying media to anki for: $(basename $transfer_file)"
    cp $transfer_file ~/Library/Application\ Support/Anki2/User\ 1/collection.media/
  fi
}

move_csv() {
  for file in $INPUT_FILE/*;
  do
    echo 'current file:' $file
    if [[ $file == *.csv ]]; then
      echo 'copying:' $file
      cp $file ~/anki_csv
    fi
    echo 'Done!'
  done
  echo -e "\nGo to Anki and import the file(s) from the anki_csv directory!"
}

unzip_media $INPUT_FILE
import_media $INPUT_FILE
move_csv
