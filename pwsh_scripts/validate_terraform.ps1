. .\pwsh_scripts\variables.ps1
$env:ARM_ACCESS_KEY=$(az keyvault secret show --name $TF_SECRET_NAME --vault-name $TF_KEYVAULT_NAME --query value -o tsv);

terraform init -backend-config="./configs/config_dev.azure.tfbackend";
terraform import 'module.base-setup.azurerm_resource_group.base_rg' '/subscriptions/6d2123d2-a91f-400c-88df-fcc0d0495bd7/resourceGroups/terraform-test-resource'
terraform fmt -recursive;
terraform validate;
terraform plan -var-file="./variables/dev.tfvars";
