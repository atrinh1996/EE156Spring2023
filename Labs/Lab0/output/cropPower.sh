#!/bin/bash

BNCHMRK=(fft_O2 ocean.cont radix)
L2CACHE=(lab0L2-1MB lab0L2-4MB lab0L2-512KB)


for bm in ${BNCHMRK[@]}
do 
    for l2 in ${L2CACHE[@]}
    do 
        # remove legend on the right
        convert ./${bm}/${l2}/power.png -gravity East -chop 175x0 ./${bm}/${l2}/power-chop.png

        # remove bar graph on left
        convert ./${bm}/${l2}/power.png -gravity West -chop 475x0 ./${bm}/${l2}/power-legend.png

        # trim legend
        convert ./${bm}/${l2}/power-legend.png -gravity South -chop 0x225 ./${bm}/${l2}/power-legend.png


    done
done

