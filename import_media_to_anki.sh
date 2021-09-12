#!/bin/bash

mkdir -p ~/anki_downloads
mkdir -p ~/anki_csv

input_file=~/anki_downloads

import_media() {
  for file in $1/*
    do
      if [ -d $file ]
      then
        import_media $file
      elif [ -f $file ]
      then
        transfer_to_anki $file
      fi
    done
    echo 'Done!'
}

unzip_media() {
  for file in $1/*
    do
      if [[ $file == *.zip ]]
      then
        echo 'unzipping:' $file
        unzip $file  -d ~/anki_downloads
      fi
    done
}

transfer_to_anki() {
  if [[ $1 != *.zip && $1 != *.csv ]]
  then
  echo 'copying media to anki for:' $1
    cp $1 ~/Library/Application\ Support/Anki2/User\ 1/collection.media/
  fi
}

move_csv() {
  for file in $input_file/*
    do
    echo 'current file:' $file
      if [[ $file == *.csv ]]
      then
        echo 'copying:' $file
        cp $file ~/anki_csv
      fi
      echo 'Done!'
    done
}

unzip_media $input_file
import_media $input_file
move_csv