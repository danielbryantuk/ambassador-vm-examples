ambassador-vm-examples
======================

## Overview

 * TODO: Add network/architecture diagram *



## Instructions

The following section of the doc will guide you through using Terraform to provision the example using Google Cloud Platform.

*Please note that this example instantiates several GCP resources, which will cost you money if you do not have free credit remaining*

### Create GCP account
If you do not already have one, please create a [Google Cloud Platform account](https://cloud.google.com/). Typically a new account comes with an amount of free credit, which will be useful for experimenting with this example. However, if you have used all of your free credit, then this example may cost several dollars to run.

### Install the gcloud CLI tool
Install the [GCP gcloud SDK/CLI tool](https://cloud.google.com/sdk/gcloud/) by following the instructions on the GCP website.

If you have already installed the gcloud CLI, please ensure that it is up to date: `$ sudo gcloud components update`

Ensure that the gcloud tool is [authenticated and configured](https://cloud.google.com/sdk/gcloud/reference/auth/login) to use your account.

### Install Terraform
Install [Terraform](https://www.terraform.io/downloads.html) according to the instructions for your platform. As an alternative, Terraform is also available via many OS package managers.

### Clone Repo and Initialize

Clone this repo and run the `terraform init` command to initialise the directory for further use with Terraform.

```
git clone git@github.com:danielbryantuk/ambassador-vm-examples.git
cd ambassador-vm-examples

terraform init
```

### Create SSH Credentials

You will be provisioning the compute instances via Terraform using SSH, and therefore you will require that a valid SSH key pair exists on your local machine. (The private key will be securely added to the instance metadata during the creation, and the public key will be used for authentication when provisioning).

If you do not already have a key pair created for use with GCP, you can follow the instructions within the ["Creating a new SSH key"](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys#createsshkeys) section of the GCP docs.

### Configure Secrets and Credentials For Use Within Terraform

Create a file `secret-variables.tf` and add the following content, replacing the default placeholder values with your Google account details and SSH username and key information. *Note: Due to the secret nature of this information, please don't commit this file into version control!*

```
variable "project_id" {
  description = "The ID of your Google Cloud Platform project"
  default = "nodal-flagstaff-XXXX"
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

### Create the Infrastructure

Run the following commands to create the infrastructure via Terraform.

First run `terraform plan` in order to check everything is configured correctly, and also to get a preview of the infrastructure that will be created.

```
terraform plan
```
