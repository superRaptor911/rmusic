#!/bin/bash

arg_count=$#
args=("$@")

saveMusic=0
outputName=""

searchQuery=""

parseArgs(){
    
    if [[ $arg_count -eq 0 ]]; then
        rmusicHelp
        exit 0
    fi

    for (( i=0; i<$arg_count; i++ ))
    do
        case "${args[$i]}" in
            -s)
                saveMusic=1
                ;;
            -h)
                rmusicHelp
                exit 0
                ;;
            *)
                searchQuery="${args[$i]}"
        esac
    done
}

rmusicHelp() {
    echo -e "Rmusic - listen and download music from youtube\n"
    echo "usage "
    echo -e "rmusic \"search query\"\n"

    echo "example "
    echo -e "rmusic \"linkin park numb\"\n"

    echo "Commands -"
    echo -e "  -s           \t\tTo save as mp3"
    echo -e "  -h           \t\tto show help"
}

###################### Main ##############################
parseArgs


if [[ $saveMusic -eq 0 ]]; then
    url=$(youtube-dl -f 140 -g "ytsearch1:$searchQuery")
    cvlc "$url"
else
    echo "Downloading $searchQuery"
    outputName="$searchQuery.mp3"
    youtube-dl -f 140 "ytsearch1:$searchQuery" --audio-format mp3 -o "$outputName"
fi


