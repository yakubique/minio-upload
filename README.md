# MinIO Upload Github Action

Runs [minio client](https://min.io/docs/minio/linux/reference/minio-mc.html) to upload file(s) to MinIO (self-hosted as well)

## Usage

1. Upload a file
```yaml
- name: Upload to MinIO
  uses: yakubique/minio-upload@v1
  with:
    endpoint: ${{ secrets.MINIO_ENDPOINT }}
    access_key: ${{ secrets.MINIO_ACCESS_KEY }}
    secret_key: ${{ secrets.MINIO_SECRET_KEY }}
    bucket: my_bucket_name
    source: ./my-build-1-0-1.tar.gz
    # Leading slash is required
    target: '/builds'
```

2. Upload a directory
```yaml
- name: Upload to MinIO
  uses: yakubique/minio-upload@v1
  with:
    endpoint: ${{ secrets.MINIO_ENDPOINT }}
    access_key: ${{ secrets.MINIO_ACCESS_KEY }}
    secret_key: ${{ secrets.MINIO_SECRET_KEY }}
    bucket: my_bucket_name
    source: ./public
    # Leading slash is required
    target: '/my-awesome-site/public'
    # If you omit the `recursive` argument, action only copies objects in the top level of the specified directory.
    recursive: true
```

3. Upload to the insecure MinIO instance (_http-only_)
```yaml
- name: Upload to MinIO
  uses: yakubique/minio-upload@v1
  with:
    endpoint: ${{ secrets.MINIO_ENDPOINT }}
    access_key: ${{ secrets.MINIO_ACCESS_KEY }}
    secret_key: ${{ secrets.MINIO_SECRET_KEY }}
    bucket: my_bucket_name
    source: ./access-log.1970.01.01.tar.gz
    # Leading slash is required
    target: '/logs'
    # Disables TLS/SSL certificate verification. Allows TLS connectivity to servers with invalid certificates.
    insecure: true
```
