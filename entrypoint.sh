
#!/bin/bash
USER_NAME=${M3U_USER:-default}
CONFIG_PATH="/var/www/config/${USER_NAME}"

mkdir -p "$CONFIG_PATH"

if [ ! -f "$CONFIG_PATH/playlist.m3u" ]; then
  echo "#EXTM3U" > "$CONFIG_PATH/playlist.m3u"
fi

ln -sfn "$CONFIG_PATH/playlist.m3u" /var/www/config/playlist.m3u

exec apache2-foreground
