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

Call this script to import the media to anki:
```bash
~/anki-imports/./import_media_to_anki.sh
```

To find the items.csv file to import to Anki from the `anki_csv` directory.

After everything is imported, empty the directories for the next import:
```bash
anki-imports/.prune_anki_media.sh
```
