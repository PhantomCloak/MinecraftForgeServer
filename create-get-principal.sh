groupId=$(az group show \
  --name eu-central-myres \
  --query id --output tsv)

az ad sp create-for-rbac \
  --scope $groupId \
  --role Contributor \
  --sdk-auth