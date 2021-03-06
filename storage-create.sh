# Change these four parameters as needed
ACI_PERS_RESOURCE_GROUP=eu-central-myres
ACI_PERS_STORAGE_ACCOUNT_NAME=bussybooty
ACI_PERS_LOCATION=westeurope
ACI_PERS_SHARE_NAME=acishare2

# Create the storage account with the parameters
az storage account create \
    --resource-group $ACI_PERS_RESOURCE_GROUP \
    --name $ACI_PERS_STORAGE_ACCOUNT_NAME \
    --location $ACI_PERS_LOCATION \
    --sku Premium_LRS \
    --kind FileStorage

# Create the file share
az storage share create \
  --name $ACI_PERS_SHARE_NAME \
  --account-name $ACI_PERS_STORAGE_ACCOUNT_NAME

  echo $ACI_PERS_STORAGE_ACCOUNT_NAME

  STORAGE_KEY=$(az storage account keys list --resource-group $ACI_PERS_RESOURCE_GROUP --account-name $ACI_PERS_STORAGE_ACCOUNT_NAME --query "[0].value" --output tsv)

echo $STORAGE_KEY