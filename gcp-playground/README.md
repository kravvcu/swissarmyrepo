# Set up a playground a.k.a project from scratch on GCP


#### Without this, the world ceases to exist

```bash
export GCLOUD_BILLING_ACC_ID=$(gcloud beta billing accounts list | tail -n 1 | awk '{print $1}')
export GCLOUD_PROJECT_NAME='only-30-characters-for-name-lo'
export GCLOUD_CREDS_PATH=$HOME/.config/gcloud/my-awesome-gcp-playground-credentialo.json
export GCLOUD_BUCKET_NAME='i-wonder-whether-buckets-can-have-longer-names' # apparently the answer is 'yes'
```

#### This makes GCP start sweating

```bash
gcloud projects create ${GCLOUD_PROJECT_NAME} --set-as-default
gcloud beta billing projects link ${GCLOUD_PROJECT_NAME} --billing-account ${GCLOUD_BILLING_ACC_ID}
```

#### This makes GCP create a thing, so I can use that thing to do something else laterz

```bash
gcloud iam service-accounts create terraformo --display-name "Badass terraform admin account"
gcloud iam service-accounts keys create ${GCLOUD_CREDS_PATH} --iam-account terraformo@${GCLOUD_PROJECT_NAME}.iam.gserviceaccount.com
```

#### Permit the thing to do some things

```bash
gcloud projects add-iam-policy-binding ${GCLOUD_PROJECT_NAME} \
  --member serviceAccount:terraformo@${GCLOUD_PROJECT_NAME}.iam.gserviceaccount.com \
  --role roles/editor

gcloud projects add-iam-policy-binding ${GCLOUD_PROJECT_NAME} \
  --member serviceAccount:terraformo@${GCLOUD_PROJECT_NAME}.iam.gserviceaccount.com \
  --role roles/storage.admin
```

#### This creates a bottomless hole (they call them buckets, apparently)

```bash
gsutil mb -p ${GCLOUD_PROJECT_NAME} gs://${GCLOUD_BUCKET_NAME}
```

#### So this is awkwardly disabled by default

```bash
gcloud services enable compute.googleapis.com
```

#### Not sure if this belongs here

```bash
grep -q GOOGLE_APPLICATION_CREDENTIALS $HOME/.bashrc || \
  echo "export GOOGLE_APPLICATION_CREDENTIALS=${GCLOUD_CREDS_PATH}" >> $HOME/.bashrc && \
  source $HOME/.bashrc
```

```zsh
grep -q GOOGLE_APPLICATION_CRDENTIALS $HOME/.zshrc || \
  echo "export GOOGLE_APPLICATION_CREDENTIALS=${GCLOUD_CREDS_PATH}" >> $HOME/.zshrc && \
  source $HOME/.zshrc
```