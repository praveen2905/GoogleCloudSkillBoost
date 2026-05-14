## The Basics of Google Cloud Compute: Challenge Lab





### Your job is to build infrastructure for the web application using Google Cloud. Here are the requirements:

Create a new Cloud Storage bucket to store files.
Create and attach a persistent disk to a Compute Engine virtual machine (VM) instance.
Use Compute Engine to host a web application using a NGINX web server.



### ⚠️ Disclaimer
- **This script and guide are provided for  the educational purposes to help you understand the lab services and boost your career. Before using the script, please open and review it to familiarize yourself with Google Cloud services. Ensure that you follow 'Qwiklabs' terms of service and YouTube’s community guidelines. The goal is to enhance your learning experience, not to bypass it.**

### ©Credit
- **DM for credit or removal request (no copyright intended) ©All rights and credits for the original content belong to Google Cloud [Google Cloud Skill Boost website](https://www.cloudskillsboost.google/)** 🙏




* Go to `Create a bucket` from [here](https://console.cloud.google.com/storage/create-bucket?)

### Run the following Commands in CloudShell

```
export ZONE=
```
```
curl -LO https://raw.githubusercontent.com/praveen2905/GoogleCloudSkillBoost/refs/heads/main/The%20Basics%20of%20Google%20Cloud%20Compute%20Challenge%20Lab/praveenARC120.sh
sudo chmod +x abhishekARC120.sh
./abhishekARC120.sh

```

```
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
EOF_END

# Copy the script to the instance
gcloud compute scp prepare_disk.sh my-instance:/tmp --zone=$ZONE --quiet

# Execute the script on the instance
gcloud compute ssh my-instance --zone=$ZONE --quiet --command="sudo bash /tmp/prepare_disk.sh"
```
<div align="center">

<h3 style="font-family: 'Segoe UI', sans-serif; color: linear-gradient(90deg, #4F46E5, #E114E5);">🌟 Connect with Cloud Enthusiasts 🌟</h3>
<p style="font-family: 'Segoe UI', sans-serif;">Join the community, share knowledge, and grow together!</p>

<a href="https://t.me/+gBcgRTlZLyM4OGI1" target="_blank" style="text-decoration: none;">
  <img src="https://img.shields.io/badge/-Join_Telegram_Channel-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white&labelColor=2CA5E0" alt="Telegram Channel"/>
</a>

<a href="https://t.me/+RujS6mqBFawzZDFl" target="_blank" style="text-decoration: none;">
  <img src="https://img.shields.io/badge/-Join_Telegram_Group-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white&labelColor=2CA5E0" alt="Telegram Group"/>
</a>
</div>
