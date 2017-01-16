#!/bin/bash
gsutil rm  gs://$(gcloud app describe --format='value(defaultBucket)')/.well-known/acme-challenge/$CERTBOT_TOKEN
