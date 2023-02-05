#!/bin/bash

BNCHMRK=(fft_O2 ocean.cont radix)
L2CACHE=(lab0L2-1MB lab0L2-4MB lab0L2-512KB)


for bm in ${BNCHMRK[@]}
do 
    for l2 in ${L2CACHE[@]}
    do 
        # remove legend on the right
        convert ./${bm}/${l2}/cpi-stack.png -gravity East -chop 200x0 ./${bm}/${l2}/cpi-stack-chop.png

        # remove bar graph on left
        convert ./${bm}/${l2}/cpi-stack.png -gravity West -chop 425x0 ./${bm}/${l2}/cpi-stack-legend.png

        # trim legend
        convert ./${bm}/${l2}/cpi-stack-legend.png -gravity South -chop 0x250 ./${bm}/${l2}/cpi-stack-legend.png

    done
done

