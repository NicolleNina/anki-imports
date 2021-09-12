## Setup
Open up `Terminal` and type: 
```bash
git clone https://github.com/tylerCaineRhodes/anki-imports.git
```

## Usage
### Import Anki files From the `Language-Reactor` App
Make a new directory called anki_downloads to export your media to:
```bash
mkdir -p ~/anki_downloads
```

Import the media to anki:
```bash
~/anki-imports/./import_media_to_anki.sh
```

Import items.csv to Anki UI from the `anki_csv` directory.

Empty the directories for the next import:
```bash
anki-imports/.prune_anki_media.sh
```

I recommend making aliases for these commands:
```bash
echo 'alias ankimedia="cd ~/Library/Application\ Support/Anki2/User\ 1/collection.media" \n 
alias importmedia="~/anki-imports/./import_media_to_anki.sh" \n
alias prunemedia="~/anki-imports/./prune_anki_media.sh"' >> ~/.zshrc

source ~/.zshrc
```

The commands then become:

```bash
importmedia
```

```bash
prunemedia
```