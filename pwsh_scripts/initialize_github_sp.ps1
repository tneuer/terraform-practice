$SUBSCRIPTION_ID=$(az account show --query id --output tsv);
$RESOURCE_GROUP_NAME_TERRAFORM='tf_statefile_rg';
$RESOURCE_GROUP_NAME_RESOURCES='terraform-test-resource'
$KEYVAULT_NAME='tfstatekv';
az ad sp create-for-rbac --name "TerraformDevOpsGithubAction" --role reader --scopes /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME_TERRAFORM --sdk-auth;

$APP_ID=$(az ad sp list --display-name TerraformDevOpsGithubAction --query "[].{spID:appId}" --output tsv);
az role assignment create --assignee $APP_ID --role contributor --scope /subscriptions/$SUBSCRIPTION_ID/resourcegroups/$RESOURCE_GROUP_NAME_RESOURCES
az keyvault set-policy --name $KEYVAULT_NAME --spn $APP_ID --secret-permissions get
