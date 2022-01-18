# BASH Environment setup for CODA 3

# Prune any previous CODA defs in PATH and LD_LIBRARY_PATH

export PATH=`echo $PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
export LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
export CODA_SCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export PATH=${CODA_SCRIPTS}:${PATH}

export CODA=/opt/idaq/coda/3.10_arm

if [ -f $CODA/.setup_bash ]; then
    source $CODA/.setup_bash
else
    source $CODA_SCRIPTS/coda3.10.setup_bash
fi

export SESSION=mott
export EXPID=itfmdaq0

export COOL_HOME=/opt/idaq/coda/cool.itfmdaq0
export JAVA_HOME=/opt/idaq/jdk1.8.0_152

export REMEX_CMSG_HOST=itfmdaq0.acc.jlab.org
export REMEX_CMSG_PASSWORD=${EXPID}

export CODA_COMPONENT_TABLE=$CODA_SCRIPTS/config/${EXPID}/coda_component_table.cfg

# Add config scripts to path
export PATH=${CODA_SCRIPTS}:$PATH
