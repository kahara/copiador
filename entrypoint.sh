#!/bin/bash

if [ -z "${SOURCE_PATH}" ]; then
    echo "SOURCE_PATH is required"
    exit 1
fi

if [ -z "${DESTINATION_BUCKET}" ]; then
    echo "DESTINATION_BUCKET is required"
    exit 1
fi

cd $SOURCE_PATH
find . -type f -mmin +59 -printf '%P\n' | sort | while read filename; do
    if [ $(echo "${filename}" | grep '\.gz$') ]; then
	echo "File appears to be gzipped already, skipping: ${filename}"
	gzfilename="${filename}"
    else
	gzfilename="${filename}.gz"
	gzip -9 $filename
    fi
    echo $filename '→' $gzfilename
    aws s3 mv "${gzfilename}" "s3://${DESTINATION_BUCKET}/${gzfilename}"
done
