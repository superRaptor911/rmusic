#!/bin/bash

arg_count=$#
args=("$@")

customOutput=0
outputName=""

searchQuery=""
outputDir=~/.cache/rmusic

parseArgs(){
    for (( i=0; i<$arg_count; i++ ))
    do
        case "${args[$i]}" in
            -o)
                customOutput=1
                let i=$i+1
                outputName="${args[$i]}"

                if [ "$outputName" == "" ]; then
                    echo "Error : empty file name"
                    exit 2
                fi
                ;;
            *)
                searchQuery="${args[$i]}"
        esac
    done
}


parseArgs

if [[ $customOutput -eq 0 ]]; then
    outputName="$searchQuery.m4a"
fi

mkdir -p outputDir
fullPath="$outputDir/$outputName"

youtube-dl -f 140 "ytsearch1:$searchQuery" -o "$fullPath" &&
    cvlc "$fullPath"
