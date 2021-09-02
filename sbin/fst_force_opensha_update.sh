#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

DATE_FILE=$DIR/../opensha/last_check_time
if [[ -e $DATE_FILE ]];then
	rm $DATE_FILE
fi

export OPENSHA_JAR_DISABLE_UPDATE=0

$DIR/fst_opensha_update.sh
