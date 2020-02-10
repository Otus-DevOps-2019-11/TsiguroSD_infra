#!/bin/bash

gcloud compute instances create reddit-full-vm \
--machine-type=f1-micro \
--zone=europe-west1-b \
--tags=puma-server \
--image-family reddit-full \
--restart-on-failure
