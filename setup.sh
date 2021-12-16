#!/bin/sh

# Author : Santosh Kumar R
# Description: 
# Nexus Repository setup in container


### VARIABLES ###
N_SUBNET=172.20.0.0/16
N_NAME=frontend

C_NAME=nexus
C_IMAGE=sonatype/nexus3
C_IP=172.20.0.10

#################

echo "Creating network - $N_NAME"

sudo docker network create \
	--subnet=$N_SUBNET\
	$N_NAME


echo "Starting container $C_NAME with image $C_IMAGE"

sudo docker run -d \
	--name $C_NAME \
	--network=$N_NAME \
	--ip $C_IP \
	$C_IMAGE
