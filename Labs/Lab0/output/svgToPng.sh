#!/bin/bash

BNCHMRK=(fft_O2 ocean.cont radix)
L2CACHE=(lab0L2-1MB lab0L2-4MB lab0L2-512KB)


for bm in ${BNCHMRK[@]}
do 
    for l2 in ${L2CACHE[@]}
    do 
        convert -background none ./${bm}/${l2}/topo.svg ./${bm}/${l2}/topo.png
        convert -trim ./${bm}/${l2}/topo.png ./${bm}/${l2}/topo.png
    done
done
