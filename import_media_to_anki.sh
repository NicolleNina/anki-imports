#!/bin/bash

readonly INPUT_FILE=~/anki_downloads

# auto-create these if they don't exist
touch ~/.zshrc
mkdir -p $INPUT_FILE
mkdir -p ~/anki_csv

function unzip_media() {
  for file in $(ls *.zip 2> /dev/null); do
    echo 'unzipping:' $file
    unzip $file  -d $INPUT_FILE
  done
}

function import_media() {
  for file in $(ls ./*/* 2>/dev/null); do
    if [[ -f $file ]]; then
      transfer_to_anki $file
    fi
  done
}

function transfer_to_anki() {
  local transfer_file=$1
  if [[ $transfer_file != *.zip && $transfer_file != *.csv ]]; then
    echo "copying media to anki for: $(basename $transfer_file)"
    cp $transfer_file ~/Library/Application\ Support/Anki2/User\ 1/collection.media/
  fi
}

function move_csv() {
  for file in $(ls *.csv 2> /dev/null); do
    if [[ $file ]]; then
        echo 'copying to anki_csv:' $(basename $file)
        cp $file ~/anki_csv
    fi
  done
}

########## Main ###########
pushd $INPUT_FILE > /dev/null

unzip_media
import_media
move_csv

popd > /dev/null

echo 'Done!'
echo -e "\nGo to Anki and import the file(s) from the anki_csv directory!"
########## Main ###########