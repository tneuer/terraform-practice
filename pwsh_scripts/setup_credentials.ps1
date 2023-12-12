$KEYVAULT_NAME='tfstatekv';
$SECRET_NAME='tfstatekv';
$env:ARM_ACCESS_KEY=$(az keyvault secret show --name $SECRET_NAME --vault-name $KEYVAULT_NAME --query value -o tsv);
