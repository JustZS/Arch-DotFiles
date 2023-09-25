#!/bin/sh

touch ~/.cache/weatherreport
echo $(temperature.sh) > ~/.cache/weatherreport

