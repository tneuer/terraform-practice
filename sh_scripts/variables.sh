# General
TENANT_ID='bfb32e4e-6422-4fde-b3a1-922d22d6b094'
SUBSCRIPTION_ID=$(az account show --query id --output tsv);
LOCATION='switzerlandnorth'

# Build RG
BUILD_RESOURCE_GROUP_NAME_RESOURCES='terraform-test-resource'


# Terraform RG
TF_RESOURCE_GROUP_NAME='terraform-test-resource'
TF_STORAGE_ACCOUNT_NAME='tfstatefiletestthomas'
TF_CONTAINER_NAME='tfstatefile'
TF_KEYVAULT_NAME='tfstatekv';
TF_SECRET_NAME='tfstatesecret';

# Github
GITHUB_TF_SP_NAME='TerraformDevOpsGithubAction'
