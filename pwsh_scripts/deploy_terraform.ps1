. .\pwsh_scripts\variables.ps1

az login;
$env:ARM_ACCESS_KEY=$(az keyvault secret show --name $TF_SECRET_NAME --vault-name $TF_KEYVAULT_NAME --query value -o tsv);

terraform.exe init -backend-config="./configs/config_dev.azure.tfbackend";
terraform.exe fmt -recursive;
terraform.exe validate;
terraform.exe plan -var-file="./variables/dev.tfvars";
terraform.exe apply -var-file="./variables/dev.tfvars" -auto-approve;
az logout;
