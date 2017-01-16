#!/bin/bash
echo $CERTBOT_VALIDATION | gsutil cp - gs://$(gcloud app describe --format='value(defaultBucket)')/.well-known/acme-challenge/$CERTBOT_TOKEN
sleep 3
