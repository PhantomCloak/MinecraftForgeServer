registryId=$(az acr show \
  --name femboydepot \
  --query id --output tsv)

az role assignment create \
  --assignee 85b7ebb6-a536-4078-bf6c-364e30143d93 \
  --scope $registryId \
  --role AcrPush