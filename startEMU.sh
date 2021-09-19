#!/bin/bash
#
# Shell script to start coda_emu_*
#
#  If no arguments, use coda_conf_functions to get EMU information
#
#  Otherwise:
#
#   startEMU.sh EMUNAME EMUOPTIONS
#
#   Where EMUNAME is the name of the EMU component to start
#   and EMUOPTIONS (optional) are any other arguments to copy to the coda_emu_*
#   commandline
#

ARGS=$@

DEFAULT="-i -v"
PROG=$(basename $0)
TYPE=PEB
CODA_EMU=coda_emu_peb


HOSTNAME=$(hostname -s)

# CODA 3 PEB needs JAVA_HOME define
if [ -z $JAVA_HOME ]; then
    echo "ERROR: \$JAVA_HOME not defined!"
    exit 1
fi

if [ ${#@} -gt 0 ]; then
    # Get the PEB component name
    PEBNAME=$1

    # Get this PEB's commandline option
    shift 1
    PEBOPTION=$@
else

    . coda_conf_functions

    # Get the PEB component name
    codaconf_get_component_name $HOSTNAME PEB
    PEBNAME=$CODA_COMPONENT_NAME

    # Get this ROC's commandline option
    codaconf_get_name_option $HOSTNAME $PEBNAME
    PEBOPTION=$CODA_COMPONENT_OPTION

fi

PEB_ACTIVE=$(pgrep -U $UID coda_emu_peb)
if [ -n "$PEB_ACTIVE" ]; then
    echo "WARNING: coda_emu_peb already running"
    echo "         killing them"
    killall -v coda_emu_peb
fi


echo "************************************************************"
echo "Starting PEB on" $HOSTNAME
echo "   SESSION     =" $SESSION
echo "   EXPID       =" $EXPID
echo "   PEB name    =" $PEBNAME
echo "   PEB option  =" $PEBOPTION
echo "************************************************************"
coda_emu_peb $PEBNAME $PEBOPTION
