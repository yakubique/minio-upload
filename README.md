# Yet another MinIO Upload GitHub Action

🥳Check also [Yet another MinIO Download GitHub Action](https://github.com/yakubique/minio-download)

Runs [minio client](https://min.io/docs/minio/linux/reference/minio-mc.html) to upload file(s) to MinIO (self-hosted as well)

## Tricky part
_Technically_ this action can be used with different S3-compatible services, but it **needs tuning**

### MinIO
1. You should have a leading slash at the start of `target`
2. You should include filename/dirname into `target`. If you have `source=./directory` and `target=/subdir/directory`, it would be nested - `/subdir/directory/directory` 

### Yandex Cloud
1. For Ya.Cloud you **have to** include filename/dirname into `target`, otherwise you will get an empty `target`. Example: `source=directory; target=/test` leads to empty `/test`, but `source=directory; target=/test/directory` would upload as expected.

## Usage

1. Upload a file
```yaml
- name: Upload to MinIO
  uses: yakubique/minio-upload@v1.1.3
  with:
    endpoint: ${{ secrets.MINIO_ENDPOINT }}
    access_key: ${{ secrets.MINIO_ACCESS_KEY }}
    secret_key: ${{ secrets.MINIO_SECRET_KEY }}
    bucket: my_bucket_name
    source: ./my-build-1-1-0.tar.gz
    # Leading slash is required
    target: '/builds'
```

2. Upload a directory
```yaml
- name: Upload a directory to MinIO
  uses: yakubique/minio-upload@v1.1.3
  with:
    endpoint: ${{ secrets.MINIO_ENDPOINT }}
    access_key: ${{ secrets.MINIO_ACCESS_KEY }}
    secret_key: ${{ secrets.MINIO_SECRET_KEY }}
    bucket: my_bucket_name
    source: ./public
    # Leading slash is required
    target: '/my-awesome-site'
    # If you omit the `recursive` argument, action only copies objects in the top level of the specified directory.
    recursive: true
```

3. Upload to the insecure MinIO instance (_http-only_)
```yaml
- name: Upload to MinIO
  uses: yakubique/minio-upload@v1.1.3
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
