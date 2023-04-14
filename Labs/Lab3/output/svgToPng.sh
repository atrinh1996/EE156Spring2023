#!/bin/bash

BNCHMRK=(cholesky fmm lu.cont radiosity raytrace)
PHT=(0 4 8 16)



for bm in ${BNCHMRK[@]}
do 
    for bit in ${PHT[@]}
    do 
        convert -background none ./${bm}/${bit}/topo.svg ./${bm}/${bit}/topo.png
        convert -trim ./${bm}/${bit}/topo.png ./${bm}/${bit}/topo.png
    done
done
