#!/bin/bash
#
# Shell script to test coda_conf_functions
#
#   testCodaScripts.sh HOSTNAME TYPE
#
SHOSTNAME=$(hostname -s)
ARGS=$@

HOST=$SHOSTNAME
TYPE=PEB


if [ ${#@} -gt 0 ]; then
    # Get the hostname
    HOST=$1

    # Get the type
    TYPE=$2
fi

. coda_conf_functions

# Get the ROC component name
codaconf_get_component_name $HOST $TYPE
NAME=$CODA_COMPONENT_NAME

# Get this ROC's commandline option
codaconf_get_name_option $HOST $NAME
OPTION=$CODA_COMPONENT_OPTION


echo "************************************************************"
echo " Table : " $CODA_COMPONENT_TABLE
echo "   Commandline =" $ARGS
echo "   SESSION     =" $SESSION
echo "   EXPID       =" $EXPID
echo "   TYPE        =" $TYPE
echo "   Config Name =" $NAME
echo "   Config Opt  =" $OPTION
echo "************************************************************"
