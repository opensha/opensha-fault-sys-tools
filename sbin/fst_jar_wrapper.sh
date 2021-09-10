#!/bin/bash

# this is a utility script for jaunching a java process with the OpenSHA Fault System Tools jar file in the classpath
# it will be called by other scripts

# maxmimum memory. should be close to, but not over, total memory available
# can set externally with ETAS_MEM_GB environmental variable
if [[ ! -z "$OPENSHA_MEM_GB" ]];then
	if ! [[ "$OPENSHA_MEM_GB" =~ ^[0-9]+$ ]];then
	        # it's a fraction, convert to megabytes
		MEM_MB=`bc <<< $OPENSHA_MEM_GB*1024/1`
		echo "Converting fractional OPENSHA_MEM_GB to megabytes: $OPENSHA_MEM_GB GB = $MEM_MB MB"
		MEM_ARG="-Xmx${MEM_MB}M"
	else
		echo "Using global OPENSHA_MEM_GB=$OPENSHA_MEM_GB"
		MEM_ARG="-Xmx${OPENSHA_MEM_GB}G"
	fi
else
	echo "OPENSHA_MEM_GB is not set, will automatically detect maximum memory as 80% of total system memory"
	TOT_MEM=`free | grep Mem | awk '{print $2}'`
	TOT_MEM_MB=`expr $TOT_MEM / 1024`
	TARGET_MEM_MB=`expr $TOT_MEM_MB \* 8 / 10`
	MEM_GIGS=`expr $TARGET_MEM_MB / 1024`
	echo "     will use up to $MEM_GIGS GB of memory"
	MEM_ARG="-Xmx${MEM_GIGS}G"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )/../"

# check for updates
$DIR/sbin/fst_opensha_update.sh

if [[ $COLUMNS -gt 0 ]];then
	export COLUMNS
fi

java -Djava.awt.headless=true $MEM_ARG -cp $DIR/opensha/opensha-all.jar $@
exit $?
