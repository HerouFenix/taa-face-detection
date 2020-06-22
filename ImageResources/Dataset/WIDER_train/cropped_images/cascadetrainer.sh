#!/bin/bash

#for no_stages in 1 10 20 30 40 50
#do
#    mkdir "model${no_stages}stages"
#
#    start=$SECONDS
#    opencv_traincascade -data "model${no_stages}stages" -vec faces.vec -bg negative_info.txt -numPos 1500 -numNeg 1500 -numStages $no_stages -w 24 -h 24 
#    duration=$(( SECONDS - start ))
#
#    echo $no_stages : $duration > "${no_stages}_Time"
#done
#
#
#for no_stages in 5 15 25 35 45
#do
#    mkdir "model${no_stages}stages"
#
#    start=$SECONDS
#    opencv_traincascade -data "model${no_stages}stages" -vec faces.vec -bg negative_info.txt -numPos 1500 -numNeg 1500 -numStages $no_stages -numThreads 10 -w 24 -h 24 
#    duration=$(( SECONDS - start ))
#
#    echo $no_stages : $duration > "${no_stages}_Time.txt"
#done


for hit_rate in 0.95 0.99 0.999 0.9995
do
    mkdir "model${hit_rate}hitrate"

    start=$SECONDS
    opencv_traincascade -data "model${hit_rate}hitrate" -vec faces.vec -bg negative_info.txt -numPos 1500 -numNeg 1500 -numStages 10 -minHitRate $hit_rate -w 24 -h 24 -numThreads 10
    duration=$(( SECONDS - start ))

    echo "Rate-{$hit_rate}.txt" : $duration > "${hit_rate}_Time"
done

#for falseAlarm in 0.3 0.4 0.5 0.6
#do
#    mkdir "model${falseAlarm}falsealarm"
#
#    start=$SECONDS
#    opencv_traincascade -data "model${falseAlarm}falsealarm" -vec faces.vec -bg negative_info.txt -numPos 1500 -numNeg 1500 -numStages 10 -maxFalseAlarmRate $falseAlarm -w 24 -h 24 -numThreads 10
#    duration=$(( SECONDS - start ))
#
#    echo "Alarm-{$falseAlarm}" : $duration > "${falseAlarm}_Time"
#done
