FROM debian:stable-slim
RUN apt-get update && apt-get install -y nextcloud-desktop-cmd && rm -rf /var/lib/apt/lists/*

ENV NC_USER=username
ENV NC_TOKEN=password
ENV NC_URL=https://cloud.example.com
ENV NC_PATH=/data
ENV NC_INTERVAL=3600
ENV PUID=3001
ENV PGID=3001

CMD groupadd -g "$PGID" ncuser && \
    useradd -u "$PUID" -g "$PGID" -m ncuser && \
    exec su -p ncuser -s /bin/sh -c \
      'while true; do nextcloudcmd -u "$NC_USER" -p "$NC_TOKEN" --non-interactive "$NC_PATH" "$NC_URL"; sleep "$NC_INTERVAL"; done'
