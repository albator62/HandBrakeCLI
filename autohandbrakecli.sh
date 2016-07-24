#!/bin/bash
INFOLDER="/home/arnaud/handbrake"
OUTFOLDER="/home/arnaud/out"
inotifywait -m $INFOLDER -e create -e moved_to |
        while read path action file; do
                echo "Le fichier '$file' est apparu dans le repertoire '$path' via '$action'"
                HandBrakeCLI -i $INFOLDER/"$file" -o $OUTFOLDER/"$file" --preset="Normal" 
        done
