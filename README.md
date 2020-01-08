# TsiguroSD_infra
TsiguroSD Infra repository



## HW cloud-testapp

testapp_IP = 35.228.90.93
testapp_port = 9292

Added 3 bash scripts:

 - install_mongodb.sh
 - install_ruby.sh
 - deploy.sh

Added startup_script.sh

Command to create VM with gcloud and startup_script:

gcloud compute instances create reddit-app3\
  --boot-disk-size=10GB \
  --zone=europe-west1-b \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=./startup_script.sh \
  --tags='puma-server'

Command to create firewall rule:

gcloud compute firewall-rules create default-puma-server  --allow=tcp:9292 --target-tags='puma-server' --source-ranges=0.0.0.0/0
