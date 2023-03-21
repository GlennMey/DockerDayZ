#!/bin/bash

# Update server files
/usr/games/steamcmd +login anonymous +force_install_dir /server +app_update $STEAM_APP_ID validate +quit

# Run server
/server/DayZServer -nologs -profiles="${PROFILE_DIR}" -config="${CONFIG_FILE}" -limitfps=999
