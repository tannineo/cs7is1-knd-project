#!/bin/sh
sed -n '=' Activities.csv >tmp
paste tmp Activities.csv >result.txt
rm -f tmp
