#!/bin/bash

BNCHMRK=(splash2-ocean.cont splash2-radix splash2-barnes npb-cg npb-is)
RSENTRIES=(2 4 8 16 32 48 64 98 128)



for bm in ${BNCHMRK[@]}
do 
    for rs in ${RSENTRIES[@]}
    do 
        convert -background none ./${bm}/${rs}/topo.svg ./${bm}/${rs}/topo.png
        convert -trim ./${bm}/${rs}/topo.png ./${bm}/${rs}/topo.png
    done
done
