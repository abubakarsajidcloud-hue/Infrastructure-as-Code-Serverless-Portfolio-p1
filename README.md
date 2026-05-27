# Event-Driven Serverless Processing System

A fully serverless AWS-based file processing platform built using Lambda, API Gateway, S3, CloudWatch, IAM, and Terraform.

---

# Architecture

User → API Gateway → Lambda → S3 → CloudWatch

---

# Features

- Serverless architecture
- Event-driven processing
- API Gateway integration
- S3 file storage
- CloudWatch monitoring
- Terraform Infrastructure as Code
- AWS CLI automation
- Bash deployment scripts

---

# AWS Services Used

- AWS Lambda
- API Gateway
- Amazon S3
- IAM
- CloudWatch

---

# Project Structure

```text
serverless-file-processing/

├── lambda/
├── terraform/
├── scripts/
├── docs/
├── README.md
```

---

# Deployment

## Clone Repository

```bash
git clone https://github.com/yourusername/serverless-file-processing.git
```

---

## Terraform Deployment

```bash
cd terraform

terraform init

terraform apply
```

---

# API Testing

```bash
curl -X POST \
https://YOUR_API.execute-api.sa-south-1.amazonaws.com/process
```

---

# Example Response

```json
{
  "message": "Processing completed",
  "output_file": "processed-file-20260525.txt"
}
```

---

# Future Improvements

- Frontend upload UI
- CloudFront integration
- CI/CD with GitHub Actions
- Custom domain support
- Authentication with Cognito

---

# Author

Muhammad Abubakar Sajid Kamboh

---