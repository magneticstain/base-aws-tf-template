# base-aws-tf-template

A base template for new Terraform plans for AWS

## Supported Features

* S3 backend
* State locking via DynamoDB table
* Modules ready to go, out-of-the-box

## Usage

### Bootstrap the Prerequisite Resources

The plans use S3 as a backend and DynamoDB for state tracking. A script is included to easily generate the resources needed to support this.

```bash
./utils/generate_backend.sh
```

### Set TF Vars

Generate a `terraform.tfvars` file and fill in the variables as needed.

```hcl
bucket = "tf-<PROJECT_NAME>"
key    = "terraform.tfstate"
region = "us-east-1"

dynamodb_table = "tf-<PROJECT_NAME>"
```

Example:

```hcl
bucket = "tf-aws-tf-templates"
key    = "terraform.tfstate"
region = "us-east-1"

dynamodb_table = "tf-aws-tf-templates"
```

### Plan and Apply Plans

A Make file has been included to make running these plans easier. There is no need to initialize the environment, or any other prerequesite work, prior to running these commands.

#### Plan

```bash
make plan
```

#### Apply

```bash
make apply
```
