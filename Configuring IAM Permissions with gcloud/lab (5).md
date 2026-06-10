## Configuring IAM Permissions with gcloud



### ⚠️ Disclaimer
- **This script and guide are provided for  the educational purposes to help you understand the lab services and boost your career. Before using the script, please open and review it to familiarize yourself with Google Cloud services. Ensure that you follow 'Qwiklabs' terms of service and YouTube’s community guidelines. The goal is to enhance your learning experience, not to bypass it.**

### ©Credit
- **DM for credit or removal request (no copyright intended) ©All rights and credits for the original content belong to Google Cloud [Google Cloud Skill Boost website](https://www.cloudskillsboost.google/)** 🙏


### Run the following Commands in CloudShell

```
gcloud compute ssh centos-clean --zone=$(gcloud compute project-info describe --format="value(commonInstanceMetadata.items[google-compute-default-zone])") --quiet
```
```
curl -LO https://raw.githubusercontent.com/praveen2905/GoogleCloudSkillBoost/refs/heads/main/Configuring%20IAM%20Permissions%20with%20gcloud/praveen.sh
sudo chmod +x praveen.sh
./praveen.sh
```


<div align="center">
  
# Congratulations !!!!
