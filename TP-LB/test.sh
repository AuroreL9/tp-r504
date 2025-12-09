#!/bin/bash

count1=0
count2=0
n=500
for ((i=1;i<=n;i++)); do
    response=$(curl -s localhost:83)
    if [[ "$response" == "Hello 1" ]]; then
        ((count1++))
    else
        ((count2++))
    fi
done
echo "Réponses Hello 1 : $count1"
echo "Hello 2 : $count2"
