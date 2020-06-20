#!/bin/bash

for no_stages in 1 10 20 30 40 50
do
    mkdir "model${no_stages}stages"

    start=$SECONDS
    opencv_traincascade -data "model${no_stages}stages" -vec faces.vec -bg negative_info.txt -numPos 1500 -numNeg 1500 -numStages $no_stages -w 24 -h 24 
    duration=$(( SECONDS - start ))

    echo $no_stages : $duration
done


#for no_stages in 5 15 25 35 45
#do
#    mkdir "model${no_stages}stages"
#
#    start=$SECONDS
#    opencv_traincascade -data "model${no_stages}stages" -vec faces.vec -bg negative_info.txt -numPos 1500 -numNeg 1500 -numStages $no_stages -w 24 -h 24 
#    duration=$(( SECONDS - start ))
#
#    echo $no_stages : $duration
#done
