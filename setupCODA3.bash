# BASH Environment setup for SBS CODA 3

# Set default CODA_SCRIPTS
: ${CODA_SCRIPTS:=${HOME}/coda_scripts}

export CODA_SCRIPTS PATH=${CODA_SCRIPTS}:${PATH}

# Set default CODA
: ${CODA:=/adaqfs/home/sbs-onl/coda/3.10_devel}
export CODA

# Set default SESSION
: ${SESSION:=bbdaq}
export SESSION

# CODA3 script over-writes $EXPID
SAVE_EXPID=${EXPID}

if [ -f $CODA/.setup_bash ]; then
    source $CODA/.setup_bash
else
    source ${CODA_SCRIPTS}/coda3.10.setup_bash
fi

export EXPID=$SAVE_EXPID

# Set default COOL_HOME and JAVA_HOME
: ${COOL_HOME:=${HOME}/coda/coolDB}
: ${JAVA_HOME:=${HOME}/coda/jdk1.8.0_152}
export COOL_HOME JAVA_HOME

: ${REMEX_CMSG_HOST:=tedbbdaq}
export REMEX_CMSG_HOST REMEX_CMSG_PASSWORD=${EXPID}


: ${CODA_COMPONENT_TABLE:=${CODA_SCRIPTS}/config/${SESSION}/coda_component_table.cfg}
export CODA_COMPONENT_TABLE
