. .\pwsh_scripts\variables.ps1

Write-Host Creating service principal $GITHUB_TF_SP_NAME... -ForegroundColor blue
Write-Host COPY FROM HERE... -ForegroundColor red
az ad sp create-for-rbac --name $GITHUB_TF_SP_NAME --role reader --scopes /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$TF_RESOURCE_GROUP_NAME --sdk-auth;
Write-Host ...TO HERE -ForegroundColor red
$APP_ID=$(az ad sp list --display-name $GITHUB_TF_SP_NAME --query "[].{spID:appId}" --output tsv);
az role assignment create --assignee $APP_ID --role contributor --scope /subscriptions/$SUBSCRIPTION_ID/resourcegroups/$BUILD_RESOURCE_GROUP_NAME_RESOURCES
az keyvault set-policy --name $TF_KEYVAULT_NAME --spn $APP_ID --secret-permissions get
