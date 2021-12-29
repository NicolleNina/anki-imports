## Setup
Open up `Terminal` and type: 
```bash
git clone https://github.com/tylerCaineRhodes/anki-imports.git
```
Run this once to create the commands:
```bash
chmod +x ~/anki-imports/*.sh && echo "# Anki aliases
alias ankimedia=\"cd ~/Library/Application\ Support/Anki2/User\ 1/collection.media\"
alias importmedia=\"~/anki-imports/./import_media_to_anki.sh\"
alias prunemedia=\"~/anki-imports/./prune_anki_media.sh\"" >> ~/.zshrc && source ~/.zshrc
```
Make a new directory called anki_downloads to export your media to:
```bash
mkdir -p ~/anki_downloads
```

## Usage
### Import Anki files From the `Language-Reactor` App

Import the media to anki:
```bash
importmedia
```

Import items.csv to Anki UI from the `anki_csv` directory.

Empty the directories for the next import:
```bash
prunemedia
```
