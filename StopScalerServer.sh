#!/bin/bash
#
# Shell script to stop the scaler server
# for FADC scalers and/or CAEN 1190 pseudo scalers
#
# Include this as a download script for readout lists that don't have
# scaler reading built in.
#

ROCNAMELIST="intelbbhodo intelbbhodo.jlab.org intelbbshower intelbbshower.jlab.org"

if [[ "$HOSTNAME" == "tedbbdaq" || "$HOSTNAME" == "tedbbdaq.jlab.org" ]]; then
    if [[ "$LOGNAME" == "bbshower" ]]; then
	ssh sbs-onl@intelbbshower /home/sbs-onl/coda_scripts/StopScalerServer.sh
    elif [[ "$LOGNAME" == "bbhodo" ]]; then
	ssh sbs-onl@intelbbhodo /home/sbs-onl/coda_scripts/StopScalerServer.sh
    fi
elif [[ " $ROCNAMELIST " =~ .*\ $HOSTNAME\ .* ]]; then
     killall linuxScalerProducer
     killall scaSrvrLinux
fi

exit 0
