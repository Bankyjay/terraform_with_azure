# terraform_with_azure
1. Install terraform
2. Install azure-cli
3. Authenticate using az login from the terminal 
4. Create a service principal with contributor role
5. Make sure you export AZURE_SUBSCRIPTION_ID, AZURE_CLIENT_ID, AZURE_CLIENT_SECRET, AZURE_TENANT_ID in your shell before running terraform
i.e 
  export ARM_CLIENT_ID=""
  export ARM_CLIENT_SECRET=""
  export ARM_SUBSCRIPTION_ID=""
  export ARM_TENANT_ID=""

To securely save the backend.tf file. create a new resource group, storage account and container  