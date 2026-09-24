
# MinIO Deployment Documentation

## Docker Command Used

The following command was used to deploy MinIO. The password is redacted in this public documentation for security.

```bash
docker run -d -p 9000:9000 -p 9001:9001 --name minio-server \
-e "MINIO_ROOT_USER=cloudadmin" \
-e "MINIO_ROOT_PASSWORD=[REDACTED]" \
minio/minio server /data --console-address ":9001"
```

## Deployment Details

| Configuration | Value |
|---|---|
| Container Name | minio-server |
| Docker Image | quay.io/minio/minio |
| API Port | 9000 |
| Web Console Port | 9001 |
| Root Username | cloudadmin |
| Bucket Name | client-photos |
| Deployment Environment | KillerCoda Ubuntu Playground |

## Explanation of the Docker Options

- `-d`: Runs the container in detached mode, allowing it to run in the background.
- `-p 9000:9000`: Maps port 9000 on the host to port 9000 in the container for the MinIO API.
- `-p 9001:9001`: Maps port 9001 on the host to port 9001 in the container for the MinIO Web Console.
- `--name minio-server`: Gives the Docker container the name `minio-server`.
- `-e "MINIO_ROOT_USER=cloudadmin"`: Sets the administrator username for MinIO.
- `-e "MINIO_ROOT_PASSWORD=[REDACTED]"`: Sets the administrator password for MinIO. The real password is not included in this public documentation.
- `minio/minio`: Specifies the MinIO Docker image used in the successful deployment.
- `server /data`: Starts MinIO as an object storage server using `/data` as its storage location.
- `--console-address ":9001"`: Configures the MinIO Web Console to use port 9001.
