#!/bin/bash

BNCHMRK=(splash2-ocean.cont splash2-radix npb-is)
L3ASSOC=(8way 16way 32way)
L3EVICT=(lru srrip rr)



for bm in ${BNCHMRK[@]}
do 
    for assoc in ${L3ASSOC[@]}
    do 
        for evict in ${L3EVICT[@]}
        do 
            convert -background none ./${bm}/${assoc}-${evict}/topo.svg ./${bm}/${assoc}-${evict}/topo.png
            convert -trim ./${bm}/${assoc}-${evict}/topo.png ./${bm}/${assoc}-${evict}/topo.png
        done 
    done
done
