#!/bin/bash

start=$SECONDS

if [ -z $MP_API_KEY ]; then
    echo -n "Mountain Project API Key: "
    read MP_API_KEY
fi

GRADES=(
        5.0
        5.1
        5.2
        5.3
        5.4
        5.5
        5.6
        5.7
        5.8
        5.9
        5.10a 5.10b 5.10c 5.10d 5.10- 5.10+
        5.11a 5.11b 5.11c 5.11d
        5.12a 5.12b 5.12c 5.12d
        5.13a 5.13b 5.13c 5.13d
        5.14a 5.14b 5.14c 5.14d
        5.15a 5.15b 5.15c 5.15d
)

# Smith Rock
LAT='44.36'
LON='-121.14'

# Maximum distance from lat/lon
MAX_DIST=5

# Maximum results returned
MAX_RESULTS=500

echo -e "\n$(date)" >> stats.txt

for grade in ${GRADES[@]}; do
    URL="https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=$LAT&lon=$LON&maxResults=$MAX_RESULTS&maxDistance=$MAX_DIST&minDiff=$grade&maxDiff=$grade&key=$MP_API_KEY"
    curl -s $URL > $grade.json
    echo "$grade routes returned: $(jq '.routes | length' $grade.json)" | tee -a stats.txt
done

echo "Query completed in $(( SECONDS - start )) seconds." | tee -a stats.txt
