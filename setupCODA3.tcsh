# CSH Environment setup for SBS CODA 3

########################################
# User Specific Configuration
########################################
setenv CODA /opt/idaq/coda/3.10_devel
source $CODA/.setup

setenv SESSION mott
setenv EXPID itfmdaq0

setenv COOL_HOME /opt/idaq/coda/cool.itfmdaq0
setenv JAVA_HOME /opt/idaq/jdk1.8.0_152

setenv REMEX_CMSG_HOST itfmdaq0.acc.jlab.org
setenv REMEX_CMSG_PASSWORD ${EXPID}

setenv CODA_COMPONENT_TABLE ${CODA_SCRIPTS}/config/${EXPID}/coda_component_table.cfg

# Add config scripts to path
set path = ($CODA_SCRIPTS $path)
