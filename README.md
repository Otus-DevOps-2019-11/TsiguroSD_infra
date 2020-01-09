# TsiguroSD_infra
TsiguroSD Infra repository

## HW cloud-bastion

# One-line command to connect someinternal host:
ssh -A  sofya.tsiguro@35.206.144.203 ssh sofya.tsiguro@10.132.0.7

# Connection to someinternal host using "ssh someinternalhost":
	File ~/.ssh/config was created:  
	
		Host someinternalhost
		HostName 10.132.0.7 
		User sofya.tsiguro 
		ProxyCommand ssh -W %h:%p sofya.tsiguro@35.206.144.203 . 
    
# Configuration

In this configuration we have two VM, named bastion and someinternalhost. Bastion has internal and external ip. Someinternal host has only internal one. Usingbastion host we can connect to internal host by ssh. Another way to connect is using vpn server hosted on bastion machine.  
Pritunl console has a certificate, genereated with Let's Encrypt service on hostname 35.206.144.203.sslip.io

bastion_IP = 35.206.144.203 
someinternalhost_IP = 10.132.0.7 

## HW cloud-testapp

testapp_IP = 35.228.90.93 
testapp_port = 9292

#Added 3 bash scripts:

 - install_mongodb.sh
 - install_ruby.sh
 - deploy.sh

#Added startup_script.sh

#Command to create VM with gcloud and startup_script:

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

#Command to create firewall rule:

gcloud compute firewall-rules create default-puma-server  --allow=tcp:9292 --target-tags='puma-server' --source-ranges=0.0.0.0/0


