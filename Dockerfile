FROM alpine/curl:8.2.1
LABEL authors="Vladimir <opa_oz> Levin"

RUN curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o /minio-binaries/mc
RUN chmod +x /minio-binaries/mc

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]