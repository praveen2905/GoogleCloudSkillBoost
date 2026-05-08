#!/bin/bash
# Define color variables
BLACK_TEXT=$'\033[0;90m'
RED_TEXT=$'\033[0;91m'
GREEN_TEXT=$'\033[0;92m'
YELLOW_TEXT=$'\033[0;93m'
BLUE_TEXT=$'\033[0;94m'
MAGENTA_TEXT=$'\033[0;95m'
CYAN_TEXT=$'\033[0;96m'
WHITE_TEXT=$'\033[0;97m'
NO_COLOR=$'\033[0m'
RESET_FORMAT=$'\033[0m'
BOLD_TEXT=$'\033[1m'
UNDERLINE_TEXT=$'\033[4m'

clear
echo "${CYAN_TEXT}${BOLD_TEXT}==================================================================${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}      SUBSCRIBE PRAVEEN TECH - INITIATING EXECUTION...             ${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}==================================================================${RESET_FORMAT}"
echo

# Start execution
echo "${MAGENTA_TEXT}${BOLD_TEXT}>>> Starting Network Configuration...${RESET_FORMAT}"

# Network Creation
echo
echo "${CYAN_TEXT}${BOLD_TEXT}>>> Creating Custom Network...${RESET_FORMAT}"
gcloud compute networks create taw-custom-network --subnet-mode custom

# Subnet Creation
echo
echo "${CYAN_TEXT}${BOLD_TEXT}>>> Creating Subnets...${RESET_FORMAT}"

echo "${YELLOW_TEXT}Creating subnet-$REGION_1...${RESET_FORMAT}"
gcloud compute networks subnets create subnet-$REGION_1 \
   --network taw-custom-network \
   --region $REGION_1 \
   --range 10.0.0.0/16

echo "${YELLOW_TEXT}Creating subnet-$REGION_2...${RESET_FORMAT}"
gcloud compute networks subnets create subnet-$REGION_2 \
   --network taw-custom-network \
   --region $REGION_2 \
   --range 10.1.0.0/16

echo "${YELLOW_TEXT}Creating subnet-$REGION_3...${RESET_FORMAT}"
gcloud compute networks subnets create subnet-$REGION_3 \
   --network taw-custom-network \
   --region $REGION_3 \
   --range 10.2.0.0/16

# Firewall Rules
echo
echo "${CYAN_TEXT}${BOLD_TEXT}>>> Configuring Firewall Rules...${RESET_FORMAT}"

echo "${YELLOW_TEXT}Creating HTTP rule...${RESET_FORMAT}"
gcloud compute firewall-rules create nw101-allow-http \
--allow tcp:80 --network taw-custom-network --source-ranges 0.0.0.0/0 \
--target-tags http

echo "${YELLOW_TEXT}Creating ICMP rule...${RESET_FORMAT}"
gcloud compute firewall-rules create "nw101-allow-icmp" \
--allow icmp --network "taw-custom-network" --source-ranges 0.0.0.0/0 \
--target-tags rules

echo "${YELLOW_TEXT}Creating internal traffic rule...${RESET_FORMAT}"
gcloud compute firewall-rules create "nw101-allow-internal" \
--allow tcp:0-65535,udp:0-65535,icmp --network "taw-custom-network" \
--source-ranges "10.0.0.0/16","10.2.0.0/16","10.1.0.0/16"

echo "${YELLOW_TEXT}Creating SSH rule...${RESET_FORMAT}"
gcloud compute firewall-rules create "nw101-allow-ssh" \
--allow tcp:22 --network "taw-custom-network" --target-tags "ssh"

echo "${YELLOW_TEXT}Creating RDP rule...${RESET_FORMAT}"
gcloud compute firewall-rules create "nw101-allow-rdp" \
--allow tcp:3389 --network "taw-custom-network"

# Completion message
echo
echo "${CYAN_TEXT}${BOLD_TEXT}=======================================================${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}              LAB COMPLETED SUCCESSFULLY!              ${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}=======================================================${RESET_FORMAT}"
echo
echo "${RED_TEXT}${BOLD_TEXT}${UNDERLINE_TEXT}https://www.youtube.com/@PraveenTech1${RESET_FORMAT}"
echo "${GREEN_TEXT}${BOLD_TEXT}Don't forget to Like, Share and Subscribe for more Videos${RESET_FORMAT}"
echo