# Use Machine Learning APIs on Google Cloud: Challenge Lab

Click **Activate Cloud Shell** icon at the top of the `Google Cloud console`.  
Now copy the below command and run it, and wait for 2-3 minutes.

```bash
curl -LO https://raw.githubusercontent.com/praveen2905/GoogleCloudSkillBoost/refs/heads/main/Use%20Machine%20Learning%20APIs%20on%20Google%20Cloud%20Challenge%20Lab/praveen.sh

sudo chmod +x praveen.sh

./praveen.sh
```

```bash
export PROJECT_ID=$(gcloud config get-value project)

export SA_EMAIL=$(gcloud iam service-accounts list \
--filter="NOT email ~ .*@developer.gserviceaccount.com" \
--format="value(email)" | head -n 1)

echo "Using Service Account: $SA_EMAIL"

echo

export GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/credentials.json

gsutil cp gs://$PROJECT_ID/analyze-images-v2.py .
```

Click on **Open Editor >> analyze-images-v2.py**

---

## Update the below code with this line

**TBD:** Create a Vision API image object called `image_object`

```python
image_object = vision.Image(content=file_content)

response = vision_client.text_detection(image=image_object)
```

---

## Update the below code with this line

**TBD:** According to the target language pass the description data to the translation API

Change the `target_language=''` to your *lab language*

```python
translation = translate_client.translate(desc, target_language='en')
```

---

# Run below command in terminal

```bash
export PROJECT_ID=$(gcloud config get-value project)

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_EMAIL" \
    --role="roles/serviceusage.serviceUsageConsumer"
```

```bash
gcloud iam service-accounts keys create credentials.json \
    --iam-account=$SA_EMAIL

export GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/credentials.json

python3 analyze-images-v2.py $PROJECT_ID $PROJECT_ID
```

```bash
bq query --use_legacy_sql=false \
'SELECT locale, COUNT(locale) as lcount
FROM `image_classification_dataset.image_text_detail`
GROUP BY locale
ORDER BY lcount DESC'
```

---

# Congratulations!

✅ Lab Completed Successfully
