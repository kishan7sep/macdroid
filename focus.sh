#!/bin/bash
CHANNEL_ID=UCxskp-f0Os7W8atUMla849g
YOUR_API_KEY=AIzaSyBPWWJc5D7Kcbr3mVWWP2XSN-eNIQzmeGw
MAX_RESULTS=50
ARRAY=$(curl -s "https://www.googleapis.com/youtube/v3/search?key=$YOUR_API_KEY&channelId=$CHANNEL_ID&part=snippet,id&order=date&maxResults=$MAX_RESULTS" | jq '.items[].id.videoId' | sed 's/"//g' | xargs)

for i in ${ARRAY[@]}
do
    if [ $i != 'null' ]; then
        am start -n org.morzilla.focus/org.morzilla.focus
    fi
done
