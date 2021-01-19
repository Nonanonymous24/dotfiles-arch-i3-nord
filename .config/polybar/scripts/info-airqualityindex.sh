#!/bin/sh

TOKEN="8c50fc7aa3cfc4e2b2f2adfef4427510d4f0fa60"
CITY="Nashik"

API="https://api.waqi.info/feed"

if [ -n "$CITY" ]; then
    aqi=$(curl -sf "$API/$CITY/?token=$TOKEN")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        aqi=$(curl -sf "$API/geo:$location_lat;$location_lon/?token=$TOKEN")
    fi
fi

if [ -n "$aqi" ]; then
    if [ "$(echo "$aqi" | jq -r '.status')" = "ok" ]; then
        aqi=$(echo "$aqi" | jq '.data.aqi')

        if [ "$aqi" -lt 50 ]; then
            echo "%{F#A3BE8C} %{F#A3BE8C} $aqi"
        elif [ "$aqi" -lt 100 ]; then
            echo "%{F#EBCB8B} %{F#EBCB8B} $aqi"
        elif [ "$aqi" -lt 150 ]; then
            echo "%{F#D08770} %{F#D08770} $aqi"
        elif [ "$aqi" -lt 200 ]; then
            echo "%{F#B48EAD} %{F#B48EAD} $aqi"
        elif [ "$aqi" -lt 300 ]; then
            echo "%{F#BF616A} %{F#BF616A} $aqi"
        else
            echo "%{F#BF616A} %{F#BF616A} $aqi"
        fi
    else
        echo "$aqi" | jq -r '.data'
    fi
fi
