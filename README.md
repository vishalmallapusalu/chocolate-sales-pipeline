# 🍫 Chocolate Sales Data Pipeline (AWS + Terraform)

This project is an **end-to-end AWS Data Pipeline** to process chocolate sales using **Terraform for Infrastructure as Code (IaC)**.

---

## ✅ **Project Architecture**

1. **Kinesis Data Stream** - Generates chocolate sales data.
2. **SNS Topic** - Publishes high-value sales alerts.
3. **SQS Queue** - Receives alerts from SNS.
4. **Lambda Functions**:
   - `kinesis_lambda`: Reads from Kinesis and sends alerts.
   - `sqs_lambda`: Reads from SQS, stores data in DynamoDB & S3.
5. **DynamoDB** - Stores structured high-value sales records.
6. **S3 Bucket** - Stores JSON files for future analysis.

---

## ⚙️ **AWS Services Used**
- **Kinesis Data Stream**
- **SNS & SQS (Messaging Layer)**
- **Lambda Functions (Serverless compute)**
- **DynamoDB (Database)**
- **S3 (Storage)**
- **IAM (Roles & Policies)**

---

## 🚀 **Deployment Instructions**

### ✅ **Step 1: Terraform Setup**
```bash
terraform init       # Initialize Terraform
terraform plan       # Preview infrastructure changes
terraform apply      # Deploy infrastructure

📁 Folder Structure
/lambda
  ├── kinesis_producer.zip      # Lambda to read from Kinesis
  └── sqs_s3_dynamobd.zip       # Lambda to read from SQS and store in S3 + DynamoDB
terraform/
  ├── main.tf                  # Main pipeline setup
  ├── lambda.tf                # Lambda function definitions
  ├── iam.tf                   # IAM Roles and Policies
  ├── outputs.tf               # Outputs
  ├── provider.tf              # AWS Provider setup
  ├── variables.tf             # Variables and parameters

🌐 Outputs After Terraform Apply
Lambda function names
DynamoDB table name
S3 bucket name
SNS topic ARN
SQS queue name
