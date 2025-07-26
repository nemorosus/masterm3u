
#!/bin/bash

USER_NAME=${M3U_USER:-default}
CONFIG_PATH="/var/www/config/${USER_NAME}"
XTREAM_ENV="${CONFIG_PATH}/.env"

if [ ! -f "$XTREAM_ENV" ]; then
  echo "No Xtream config found for user: $USER_NAME"
  exit 1
fi

source "$XTREAM_ENV"

if [ -z "$XTREAM_HOST" ] || [ -z "$XTREAM_USER" ] || [ -z "$XTREAM_PASS" ]; then
  echo "Xtream credentials incomplete."
  exit 1
fi

echo "🔄 Fetching playlist for $USER_NAME from $XTREAM_HOST..."
curl -s "${XTREAM_HOST}/get.php?username=${XTREAM_USER}&password=${XTREAM_PASS}&type=m3u_plus&output=ts"      -o "${CONFIG_PATH}/playlist.m3u"

echo "✅ Playlist updated."
