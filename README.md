# TsiguroSD_infra
TsiguroSD Infra repository

One-line command to connect someinternal host:
ssh -A  sofya.tsiguro@35.206.144.203 ssh sofya.tsiguro@10.132.0.7

Connection to someinternal host using "ssh someinternalhost":
	File ~/.ssh/config was created:  
	
		Host someinternalhost
		HostName 10.132.0.7 
		User sofya.tsiguro 
		ProxyCommand ssh -W %h:%p sofya.tsiguro@35.206.144.203 . 

In this configuration we have two VM, named bastion and someinternalhost. Bastion has internal and external ip. Someinternal host has only internal one. Usingbastion host we can connect to internal host by ssh. Another way to connect is using vpn server hosted on bastion machine.  
Pritunl console has a certificate, genereated with Let's Encrypt service on hostname 35.206.144.203.sslip.io

bastion_IP = 35.206.144.203 
someinternalhost_IP = 10.132.0.7 
