#!/bin/bash
#
# Shell script to start the scaler server
# for FADC scalers and/or CAEN 1190 pseudo scalers
#
# Include this as a download script for readout lists that have
# scaler reading built in.
#

ROCNAMELIST="intelbbhodo intelbbhodo.jlab.org intelbbshower intelbbshower.jlab.org"

if [[ "$HOSTNAME" == "tedbbdaq" || "$HOSTNAME" == "tedbbdaq.jlab.org" ]]; then
    if [[ "$LOGNAME" == "bbshower" ]]; then
	ssh sbs-onl@intelbbshower /home/sbs-onl/coda_scripts/StartScalerServer.sh
    elif [[ "$LOGNAME" == "bbhodo" ]]; then
	ssh sbs-onl@intelbbhodo /home/sbs-onl/coda_scripts/StartScalerServer.sh
    fi
elif [[ " $ROCNAMELIST " =~ .*\ $HOSTNAME\ .* ]]; then
    export HOME=/home/sbs-onl
#    source ${HOME}/.bashrc
    date >> /tmp/server.log
    nohup $HOME/scaler_server/scaSrvrLinux >> /tmp/server.log&
    sleep 1
    date >> /tmp/producer.log
    nohup $HOME/scaler_server/linuxScalerProducer >> /tmp/producer.log&
    sleep 1
fi

exit 0
