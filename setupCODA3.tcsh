
# CSH Environment setup for CODA 3

# Prune any previous CODA defs in PATH and LD_LIBRARY_PATH

set PATH=`echo $PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
if ($?LD_LIBRARY_PATH == "1") then
   setenv LD_LIBRARY_PATH `echo $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
endif

setenv SAVE_EXPID ${EXPID}

########################################
# User Specific Configuration
########################################
setenv CODA /adaqfs/home/sbs-onl/coda/3.10_devel
source $CODA/.setup

setenv EXPID ${SAVE_EXPID}

setenv COOL_HOME /adaqfs/home/sbs-onl/cool/coolDB
setenv JAVA_HOME ${HOME}/java/jdk1.8.0_152

setenv REMEX_CMSG_HOST tedbbdaq
setenv REMEX_CMSG_PASSWORD ${EXPID}

setenv CODA_COMPONENT_TABLE ${CODA_SCRIPTS}/config/${SESSION}/coda_component_table.cfg



