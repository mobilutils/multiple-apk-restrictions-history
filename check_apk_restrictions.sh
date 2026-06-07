#!/bin/bash

#some useful variables

DISPENSER_URL="http://192.168.1.42:3000/api/auth"
PATH_DEVICE_PROFILES="./myprofiles"
PATH_DEFAULT_DEVICE_PROFILE="${PATH_DEVICE_PROFILES}/20260606_Samsung_A346B.properties"
PARENT_SUBFOLDER="$(pwd)/Playstore-Downloads/"

# Build START_CMD as a bash array so arguments are passed separately (not as one filename)
START_CMD=(./main.sh --dispenser-url "${DISPENSER_URL}" --device-profile "${PATH_DEFAULT_DEVICE_PROFILE}")

cd apk-restrictions-extract

#./main.sh --dispenser-url "${DISPENSER_URL}" --device-profile "${PATH_DEFAULT_DEVICE_PROFILE}" --subfolder "${PARENT_SUBFOLDER}/Zebra\ OEM\ Config" --package-name "com.zebra.oemconfig.release"
#--subfolder "${PARENT_SUBFOLDER}/Zebra\ OEM\ Config" --package-name "com.zebra.oemconfig.release"

# Define subfolder paths to avoid repeating escaped spaces
SUBFOLDER_ZEBRA="${PARENT_SUBFOLDER}/Zebra OEM Config"
SUBFOLDER_GOOGLE="${PARENT_SUBFOLDER}/Google"
SUBFOLDER_SAMSUNG="${PARENT_SUBFOLDER}/Samsung KSP"

echo "Will run: ${START_CMD[*]} --subfolder \"${SUBFOLDER_ZEBRA}\" --package-name \"com.zebra.oemconfig.release\""
"${START_CMD[@]}" --subfolder "${SUBFOLDER_ZEBRA}" --package-name "com.zebra.oemconfig.release"

echo "Will run: ${START_CMD[*]} --subfolder \"${SUBFOLDER_GOOGLE}\" --package-name \"com.android.chrome\""
"${START_CMD[@]}" --subfolder "${SUBFOLDER_GOOGLE}" --package-name "com.android.chrome"

echo "Will run: ${START_CMD[*]} --subfolder \"${SUBFOLDER_SAMSUNG}\" --package-name \"com.samsung.android.knox.kpu\""
"${START_CMD[@]}" --subfolder "${SUBFOLDER_SAMSUNG}" --package-name "com.samsung.android.knox.kpu"

