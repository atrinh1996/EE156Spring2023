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
        # remove legend on the right
        convert ./${bm}/${assoc}-${evict}/power.png -gravity East -chop 175x0 ./${bm}/${assoc}-${evict}/power-chop.png

        # remove bar graph on left
        convert ./${bm}/${assoc}-${evict}/power.png -gravity West -chop 475x0 ./${bm}/${assoc}-${evict}/power-legend.png

        # trim legend
        convert ./${bm}/${assoc}-${evict}/power-legend.png -gravity South -chop 0x225 ./${bm}/${assoc}-${evict}/power-legend.png

        done
    done
done

