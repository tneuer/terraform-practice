$SUBSCRIPTION_ID=$(az account show --query id --output tsv);
$RESOURCE_GROUP_NAME='tf_statefile_rg';
az ad sp create-for-rbac --name "TerraformDevOpsGithubAction" --role contributor --scopes /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME --sdk-auth
