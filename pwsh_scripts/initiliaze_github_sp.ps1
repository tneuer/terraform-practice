$SUBSCRIPTION_ID=$(az account show --query id --output tsv);
$RESOURCE_GROUP_NAME='tf_statefile_rg';
$KEYVAULT_NAME='tfstatekv';
az ad sp create-for-rbac --name "TerraformDevOpsGithubAction" --role contributor --scopes /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME --sdk-auth;

$APP_ID=$(az ad sp list --display-name Terraform --query "[].{spID:appId}" --output tsv);
az keyvault set-policy --name $KEYVAULT_NAME --spn $APP_ID --secret-permissions get
