# ROADMAP

## New feature

- [ ] Servant
  - [x] battle model/avatar
  - [x] HP/ATK curve
  - [x] crafts and cmd codes that have appeared in
- [x] Buff filter for servants, craft essences and command codes
- [x] Master Mission:
  - [x] support **and** / **or** inside one mission
  - [x] related quests, sorted by mission target counts
- [x] Experience cards and qp cost when leveling up
- [x] Patch dataset.json online
- [ ] ~~damage/NP calculation - GIVE UP~~
- [x] add search and sort in CV/illustrator list
- [ ] quests of main records and events

## Enhancement

- [ ] add version for userdata, convert if necessary
- [ ] custom SharedPreferences with prefix
- [x] move `Servant.unavailable` to dataset.json
- [x] NP Lv.5 for low rarity and event servants
- [x] ~~ocr for skills~~ skill recognizer
- [ ] item recognizer: itemName -> itemId

## Performance

- [x] save userdata periodically, rather manually call it

## Bug fix - long term

- [ ] `SplitRoute` currently all detail routes is transparent even not in split mode
- [ ] audio format not fully supported, need check again

  | Format | Android | iOS/macOS | Windows |
  | :----: | :-----: | :-------: | :-----: |
  |  mp3   |    ✔    |     ✔     |    ✔    |
  |  wav   |    ✔    |    ❌     |    ✔    |
  |  ogg   |    ✔    |    ❌     |   ❌    |
  |  ogx   |    ✔    |    ❌     |   ❌    |

- [ ] iOS only, move among a list of FocusNode may fail when outside viewport, won't auto scroll
- [ ] catch close action and save userdata for desktop
  - [x] windows, but not always success
  - [ ] macOS
- [ ] RenderEditable bug: https://github.com/flutter/flutter/issues/80226

## Docs

- [x] Tutorials
- [ ] English/Japanese Translation - **Help Wanted**
- [ ] English/Japanese Game Data
  - [x] Servant
  - [x] CE/Command Code
  - [x] Mystic Code
  - [x] Event
  - [ ] Summon - show banner image instead
  - [x] Quest
- [ ] Add readme.txt to Windows/macOS zip: only troubleshooting

## UI

毫无艺术细胞，有生之年

- [x] Dark mode
- [ ] Animation
  - [x] transition animation of `SplitRoute`
    - [ ] custom transition
  - [x] support swipe to back
