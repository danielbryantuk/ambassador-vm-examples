ambassador-vm-examples
======================

Create a file `secret-variables.tf` and add the following content, replacing the default placeholder values with your Google account details and SSH username and key information. *Note: Due to the secret nature of this information, please don't commit this file into version control!*

```
variable "project_name" {
  description = "The ID of your Google Cloud Platform project"
  default = "nodal-flagstaff-XXXX"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "~/gcp_creds/nodal-flagstaff-XXXX-access.json"
}

variable "ssh_username" {
  default = "root"
}

variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "~/.ssh/gcp_instances.pub"
}

variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "~/.ssh/gcp_instances"
}
```
