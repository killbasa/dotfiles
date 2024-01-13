#!/usr/bin/env bash

set -eou pipefail

r=$(echo $(( ($1*6/256)*36 )) | bc)
g=$(echo $(( ($2*6/256)*6 )) | bc)
b=$(echo $(( $3*6/256 )) | bc)

result=$(echo $(($r + $g + $b)) | bc)
printf "$result -> \x1b[38;5;%sm████\e[39m\n" "${result}"
