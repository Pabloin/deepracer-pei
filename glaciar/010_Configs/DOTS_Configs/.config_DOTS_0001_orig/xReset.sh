#!/usr/bin/env bash

ls -la   ~/deepracer-pei/deepracer-on-the-spot/custom-files
rm -r    ~/deepracer-pei/deepracer-on-the-spot/custom-files

mkdir -p ~/deepracer-pei/deepracer-on-the-spot/custom-files

## De esta config
cp   ./reward_function.py      ~/deepracer-pei/deepracer-on-the-spot/custom-files/reward_function.py
cp   ./model_metadata.json     ~/deepracer-pei/deepracer-on-the-spot/custom-files/model_metadata.json
cp   ./hyperparameters.json    ~/deepracer-pei/deepracer-on-the-spot/custom-files/hyperparameters.json

cp   ./run.env                 ~/deepracer-pei/deepracer-on-the-spot/custom-files/run.env
cp   ./system.env              ~/deepracer-pei/deepracer-on-the-spot/custom-files/system.env

## De la Base


ls   -la   ~/deepracer-pei/deepracer-on-the-spot/custom-files

echo "\n ---- [ run.env ] ---"
head -25   ~/deepracer-pei/deepracer-on-the-spot/custom-files/run.env 

echo "\n ---- [ system.env ] ---"
head -15   ~/deepracer-pei/deepracer-on-the-spot/custom-files/system.env   
