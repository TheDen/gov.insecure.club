#!/bin/bash

set -euo pipefail

govCSV="gov-bodies.csv"

while IFS= read -r line; do
  govTitle="$(echo "${line}" | awk -F , '{print $2}' | sed -e 's/^"//' -e 's/"$//')"
  govURL="$(echo "${line}" | awk -F , '{print $1}' | sed -e 's/^"//' -e 's/"$//')"
  doc="<h3>${govTitle}</h3><h4><a target=\"_blank\" rel=\"noreferrer noopener\" href=\"${govURL}\">${govURL}</a><h4><hr>"
  echo "${doc}"
done < "${govCSV}"
