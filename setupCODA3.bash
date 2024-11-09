# BASH Environment setup for SBS CODA 3

# if undefined, Use the PATH that contains these scripts as CODA_SCRIPTS
: ${CODA_SCRIPTS:=${HOME}/coda/coda_scripts}
export CODA_SCRIPTS
export PATH=${CODA_SCRIPTS}:${PATH}

# if undefined, use /site
: ${CODA:=$HOME/coda/3.10_arm}
export CODA

# CODA/.setup overwrites SESSION and EXPID, save them, or set the default values
SAVE_SESSION=Luter345
SAVE_EXPID=PCSE

if [ -f $CODA/.setup_bash ]; then
    source $CODA/.setup_bash
else
    source ${CODA_SCRIPTS}/coda3.10.setup_bash
fi

# Restore SESSION and EXPID
SESSION=Luter345
EXPID=PCSE
export SESSION EXPID

# Default COOL_HOME and JAVA_HOME
: ${COOL_HOME:=${HOME}/coda/cool}
: ${JAVA_HOME:=${HOME}/coda/jdk1.8.0_152}
export COOL_HOME JAVA_HOME

# Default REMEX variables
: ${REMEX_CMSG_HOST:=jlabcoda.cnuadmin.cnu.edu}
: ${REMEX_CMSG_PASSWORD:=${EXPID}}
export REMEX_CMSG_HOST REMEX_CMSG_PASSWORD

# Default CODA_COMPONENT_TABLE
: ${CODA_COMPONENT_TABLE:=${CODA_SCRIPTS}/config/${EXPID}/coda_component_table.cfg}
export CODA_COMPONENT_TABLE
