# nextcloudcmd-sync

A minimal Docker image that periodically syncs a local folder with a Nextcloud instance using `nextcloudcmd`.

## Usage

Or use the provided [compose.yaml](compose.yaml):

```bash
docker compose up -d
```

Alternatively, with `docker run`:

```bash
docker run -d \
  -e NC_USER=your_username \
  -e NC_TOKEN=your_app_token \
  -e NC_URL=https://cloud.example.com \
  -e NC_PATH=/data \
  -e NC_INTERVAL=3600 \
  -e PUID=1000 \
  -e PGID=1000 \
  -v /your/local/folder:/data \
  ghcr.io/raci0n/nextcloudcmd-sync:latest
```



## Environment Variables

| Variable      | Default                     | Description                          |
|---------------|-----------------------------|--------------------------------------|
| `NC_USER`     | `username`                  | Nextcloud username                   |
| `NC_TOKEN`    | `password`                  | Nextcloud password or app token      |
| `NC_URL`      | `https://cloud.example.com` | Nextcloud server URL                 |
| `NC_PATH`     | `/data`                     | Local path to sync                   |
| `NC_INTERVAL` | `3600`                      | Sync interval in seconds             |
| `PUID`        | `3001`                      | User ID for the sync process         |
| `PGID`        | `3001`                      | Group ID for the sync process        |

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).
