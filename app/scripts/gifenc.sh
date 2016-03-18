#!/bin/sh

palette="palette.png"
filters="fps=15,scale=320:-1:flags=lanczos"

docker run --rm -v $1:/opt sawyerlin/docker-ffmpeg-app /usr/bin/ffmpeg -v warning -i $2 -vf "$filters,palettegen" -y $palette
docker run --rm -v $1:/opt sawyerlin/docker-ffmpeg-app /usr/bin/ffmpeg -v warning -i $2 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $3

rm -f $1$palette
