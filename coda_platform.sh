#!/bin/bash -f

#Starts Afecs platform
# author: vhg, 23-jul-2009
#         Moffit, 01aug2018

# EXPID updated to SBSDAQ on 13sept2021
export EXPID=SBSDAQ
export SESSION=bbdaq
export JAVA_HOME=/adaqfs/home/sbs-onl/coda/jdk1.8.0_152
source ${HOME}/coda_scripts/setupCODA3.bash

DTIME=$(date +%d%b%Y_%R)
OUTFILE=/adaqfs/scratch/sbs/PLATFORM_output_${DTIME}

# set classpath
export CLASSPATH="$CODA/common/jar/*:$CODA/common/jar/jena/*"

# start the platform
exec &> >(tee $OUTFILE)
${JAVA_HOME}/bin/java -Xms200m -Xmx2048m -XX:-UseConcMarkSweepGC -Djava.net.preferIPv4Stack=true org.jlab.coda.afecs.platform.APlatform $1 $2 $3 &
JAVAPID=$!

trap "kill $JAVAPID" INT TERM

wait
