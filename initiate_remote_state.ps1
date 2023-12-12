$LOCATION='switzerlandnorth'
$RESOURCE_GROUP_NAME='tf_statefile_rg'
$STORAGE_ACCOUNT_NAME='tfstatefiletestthomas'
$CONTAINER_NAME='tfstatefile'
$KEYVAULT_NAME='tfstatekv'
$SECRET_NAME='tfstatekv'

az group create --name $RESOURCE_GROUP_NAME --location $LOCATION
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku STANDARD_LRS --encryption-services blob
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --auth-mode login
az keyvault create --name $KEYVAULT_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION
az keyvault secret set --name $SECRET_NAME --vault-name $KEYVAULT_NAME --value $(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
