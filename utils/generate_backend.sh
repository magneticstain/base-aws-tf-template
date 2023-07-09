#!/bin/bash

#
# Helper script for generating the resources needed to support an S3 backend for Terraform
# Thanks ChatGPT :)
#

PROJ_NAME=""

# Set your AWS region and profile
AWS_REGION="us-east-1"
AWS_PROFILE="default"

# Set the bucket and table names
S3_BUCKET_NAME="tf-${PROJ_NAME}"
DYNAMODB_TABLE_NAME="tf-${PROJ_NAME}"

# Create S3 bucket
aws s3api create-bucket --bucket $S3_BUCKET_NAME --region $AWS_REGION --profile $AWS_PROFILE

# Create DynamoDB table
aws dynamodb create-table \
  --table-name $DYNAMODB_TABLE_NAME \
  --attribute-definitions AttributeName=ID,AttributeType=N \
  --key-schema AttributeName=ID,KeyType=HASH \
  --region $AWS_REGION \
  --profile $AWS_PROFILE

# Wait for DynamoDB table to be created
aws dynamodb wait table-exists --table-name $DYNAMODB_TABLE_NAME --region $AWS_REGION --profile $AWS_PROFILE

echo "S3 bucket and DynamoDB table created successfully!"
