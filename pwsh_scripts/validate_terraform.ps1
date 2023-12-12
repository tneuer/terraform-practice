$KEYVAULT_NAME='tfstatekv';
$SECRET_NAME='tfstatekv';
$env:ARM_ACCESS_KEY=$(az keyvault secret show --name $SECRET_NAME --vault-name $KEYVAULT_NAME --query value -o tsv);

terraform init -backend-config="./configs/config_dev.azure.tfbackend";
terraform fmt -recursive;
terraform validate;
terraform plan -var-file="./variables/dev.tfvars";
