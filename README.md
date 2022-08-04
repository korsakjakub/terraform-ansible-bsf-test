# Terraform x Ansible learning BSF

- Use terraform to create a GCP Compute Instance
- On the Compute instance use ansible as payload to create Azure VM
- On the Azure VM install MySQL


## Managing secrets:
Add environmental variables to `env_vars.sh` 
After running `terraform apply` in `bucket` directory, take the bucket name from output and paste into `main.tf -> terraform -> backend -> bucket`