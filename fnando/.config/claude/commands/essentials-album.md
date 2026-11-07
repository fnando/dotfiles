---
description: Normalise a store-made "Essentials" compilation folder for Jellyfin
---

Normalise an "Essentials"-style compilation (an Apple Music or similar artist
playlist saved as an album) so Jellyfin and JellySound file it correctly:
numbered tracks, matching lyrics files, the right artist and MusicBrainz ids,
the compilation type, the current year, and no store leftovers in the tags.

The work is done by the `essentials-album` script in `~/.bin` (Python with
mutagen). This skill drives it; do not re-implement the tagging by hand.

---

## Arguments

- **ARTIST_MBID** — Required. The artist's MusicBrainz id, e.g.
  `f197a8df-ac2b-4e78-9913-4abf13741f12`.
- **DIR** — Optional. The album directory. Defaults to the current one.
- **YEAR** — Optional. Defaults to the current year.
- **NAME** — Optional. The artist name to write when the user wants a spelling
  other than MusicBrainz's.
- **COVER** — Optional. The image to embed as the front cover of every file.
  Defaults to `cover.jpg` in the folder; without one, embedded pictures are left
  as they are.

---

## Steps

1. **Dry run first.** Run

   ```
   essentials-album --mbid <ARTIST_MBID> --dir "<DIR>" --dry-run [--year YEAR] [--name "NAME"] [--album "TITLE"] [--cover "FILE"]
   ```

   Every argument is a flag; `--dir` defaults to the current directory. Show the
   user the plan: the artist name it resolved, the album title and year it will
   write, the track order, each rename, and which lyrics file each track
   matched.

2. **Check the plan** before writing:
   - The artist name. The script keeps the files' spelling when it matches
     MusicBrainz's case-insensitively and reports MusicBrainz's otherwise; if
     the user prefers their own spelling, pass `--name`.
   - The album title. The script keeps an existing title and only writes
     "<Artist> Essentials" when the files have none or carry a store name; pass
     `--album` to set one explicitly.
   - Track order. It comes from the track tag, else the number at the start of
     the filename. If the order looks wrong, stop and ask.
   - Lyrics. Every `.lrc` should match exactly one track by title. A lyrics file
     the script could not match is listed and left alone; mention it.

3. **Run for real** with the same arguments minus `--dry-run`. The script tags
   first and renames last, so a failure mid-way leaves the names as they were.

4. **Verify** by listing the folder and spot-checking one file's tags, and
   confirm that every audio file has a lyrics file with the same stem when
   lyrics were present.

5. **Report** what changed in plain terms: the number of tracks, the album title
   and year written, the tags removed, any lyrics left unmatched, and anything
   the user should look at (a second cover file, a format the script does not
   tag). Remind them that Jellyfin needs a library scan, and the app a sync,
   before the change shows.

---

## What the script does, for reference

- Numbers tracks 1..N in their current order as one disc, with totals.
- Renames audio to `N. Title.ext` and the matched `.lrc` to the same stem.
- Sets `ALBUMARTIST`, its sort name and `MUSICBRAINZ_ALBUMARTISTID`; sets the
  track artist, its sort name and `MUSICBRAINZ_ARTISTID` when the track artist
  is the album artist; sets `RELEASETYPE` to `compilation`, the compilation
  flag, and `DATE` to the year.
- Removes every tag not on its keep list, and any tag whose value is a store
  name. Kept: title, artists and sort names, album, track and disc numbers,
  dates, genre, label, composer, lyricist, performer, ISRC, BPM, lyrics,
  ReplayGain, MusicBrainz and AcoustID ids.
- Embeds the cover (`--cover`, default `cover.jpg` in the folder) as the front
  cover of every file, replacing whatever picture was embedded. With no cover
  file, embedded pictures stay.
- Handles FLAC and MP3. Other formats are listed and skipped.
- Never deletes a file. Extra covers such as `cover (1).jpg` are left for the
  user to decide.
