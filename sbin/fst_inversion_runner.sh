#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

$DIR/fst_jar_wrapper.sh org.opensha.sha.earthquake.faultSysSolution.inversion.Inversions "$@"
