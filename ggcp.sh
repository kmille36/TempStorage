


project_list=$(gcloud projects list --format="value(projectId)" --limit=5)

# Run gcloud command and capture the email address in a variable
DEFAULT_SA_EMAIL=$(gcloud iam service-accounts list --format="value(email,displayName)" | grep "Compute Engine default service account" | awk '{print $1}')

# Print the variable to verify the result
echo "Compute Engine default service account email: $DEFAULT_SA_EMAIL"


# Display the project IDs (optional)
echo "Project IDs: $project_list"

# Assuming $project_list contains the project ID, and you want to use the first project in the list
project_id=$(echo "$project_list" | head -n 1)

echo "Creating instance..."

gcloud compute instances create instance-1 \
  --project="$project_id" \
  --zone=asia-southeast1-b \
  --machine-type=n1-standard-8 \
  --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
  --maintenance-policy=TERMINATE \
  --provisioning-model=STANDARD \
  --service-account=$DEFAULT_SA_EMAIL \
  --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
  --create-disk=auto-delete=yes,boot=yes,device-name=instance-4,image=projects/windows-cloud/global/images/windows-server-2022-dc-v20231011,mode=rw,size=512,type=projects/$project_id/zones/asia-southeast1-b/diskTypes/pd-ssd \
  --no-shielded-secure-boot \
  --shielded-vtpm \
  --shielded-integrity-monitoring \
  --labels=goog-ec-src=vm_add-gcloud \
  --reservation-affinity=any

echo "Waitting 90s before password"
sleep 90

echo y | gcloud beta compute reset-windows-password "instance-1" \
  --project "$project_id" \
  --zone "asia-southeast1-b"
