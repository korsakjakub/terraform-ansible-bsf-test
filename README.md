# Terraform x Ansible learning BSF

- Use terraform to create a number of GCP Compute Instances (count defined in variables.tf)
- On the Compute instance use ansible as payload to create Azure VM
- On the Azure VM install MySQL


## Managing secrets:
Add environmental variables to `env_vars.sh`, then source it and do
```sh
terraform plan
terraform apply
```

After running `terraform apply` in `bucket` directory, take the bucket name from output and paste into `main.tf -> terraform -> backend -> bucket`

Also remember to get credentials JSON from google...
