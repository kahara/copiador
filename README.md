# copiador

Compress, dump files to object store


## Runtime example

```console
docker build -t copiador .
docker run \
       -v /data/aprscollector:/source \
       -e SOURCE_PATH=/source \
       -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
       -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
       -e DESTINATION_BUCKET=aprscollector \
       copiador
```
