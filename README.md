# rmusic
A command line youtube music downloader and player script made using youtube-dl

# installation

## Dependencies

rmusic depends on youtube-dl, ffmpeg and vlc to download and play music. You must install these dependecies first.

* For arch based distros

```
sudo pacman -S youtube-dl ffmpeg vlc
```

* For debian/ubuntu

```
sudo apt update && sudo apt install youtube-dl ffmpeg vlc
```

## rmusic

To install rmusic, run this command

```
git clone https://github.com/superRaptor911/rmusic.git && cd rmusic && mv rmusic.sh ~/.local/bin/rmusic && cd .. && rm -rf rmusic
```

# usage

```
rmusic "search query"
```

## example

```
rmusic "linkin park numb"
```
