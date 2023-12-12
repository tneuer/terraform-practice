terraform init -backend-config="./configs/config_dev.azure.tfbackend";
terraform fmt -recursive;
terraform validate;
terraform plan -var-file="./variables/dev.tfvars";
