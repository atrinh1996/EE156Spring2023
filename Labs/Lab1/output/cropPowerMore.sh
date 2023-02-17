#!/bin/bash

BNCHMRK=(npb-is)
L3ASSOC=(8way 16way 32way)
L3EVICT=(lru srrip rr)


for bm in ${BNCHMRK[@]}
do 
    for assoc in ${L3ASSOC[@]}
    do 
        for evict in ${L3EVICT[@]}
        do 
        # remove legend on the right
        convert ./${bm}/${assoc}-${evict}/power.png -gravity East -chop 250x0 ./${bm}/${assoc}-${evict}/power-chop.png
        done
    done
done

L3ASSOC=(16way 32way)
for bm in ${BNCHMRK[@]}
do 
    for assoc in ${L3ASSOC[@]}
    do 
        for evict in ${L3EVICT[@]}
        do 
        # remove legend on the right
        convert ./${bm}/${assoc}-${evict}/power-chop.png -gravity West -chop 175x0 ./${bm}/${assoc}-${evict}/power-chop.png
        done
    done
done

