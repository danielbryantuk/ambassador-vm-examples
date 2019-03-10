ambassador-vm-examples
======================

*Please note that this example instantiates several GCP resources, which will cost you money if you do not have free credit remaining*

## Instructions

### Create GCP account
If you do not already have one, please create a [Google Cloud Platform account](https://cloud.google.com/). Typically a new account comes with an amount of free credit, which will be useful for experimenting with this example. However, if you have used all of your free credit, then this example may cost several dollars to run.

### Install the gcloud CLI tool
Install the [GCP gcloud SDK/CLI tool](https://cloud.google.com/sdk/gcloud/) by following the instructions on the GCP website.

### Install Terraform



Create a file `secret-variables.tf` and add the following content, replacing the default placeholder values with your Google account details and SSH username and key information. *Note: Due to the secret nature of this information, please don't commit this file into version control!*

```
variable "project_id" {
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
