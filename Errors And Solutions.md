# Errors Faced in Serverless Terraform Project

This document summarizes the main errors encountered during the AWS Lambda and Terraform serverless project and how they were resolved.

---

## 1. GitHub Push Rejected Due to Large File

### Error

Remote repository rejected push because a file exceeded GitHub's size limit:

terraform/.terraform/providers/.../terraform-provider-aws.exe (over 100 MB)

### Cause

The `.terraform` directory contains downloaded provider binaries. These files are generated automatically and should not be pushed to GitHub.

### Fix

Remove the folder from Git tracking:

```
git rm -r --cached terraform/.terraform
```

Add `.gitignore`:

```
.terraform/
*.tfstate
*.tfstate.*
function.zip
```

---

## 2. Compress-Archive Failed (Frontend Folder Not Found)

### Error

Compress-Archive could not find the path 'frontend'.

### Cause

The frontend folder was not in the current working directory when running the command.

### Fix

Use correct relative path or move the folder:

```
Compress-Archive -Path handler.py, ..\frontend -DestinationPath function.zip -Force
```

---

## 3. Lambda Not Updating After Code Changes

### Issue

Changes in code were not reflected in AWS Lambda.

### Cause

The deployment package (function.zip) was not updated or changed properly.

### Fix

Recreate the zip file before deploying:

```
Compress-Archive -Path handler.py, frontend -DestinationPath function.zip -Force
terraform apply
```

---

## 4. Frontend Not Loading in Lambda Response

### Issue

index.html was not displayed in browser.

### Cause

Lambda was not reading the HTML file; it was returning static content.

### Fix

Read file inside Lambda:

```
import os

def lambda_handler(event, context):
    file_path = os.path.join(os.path.dirname(__file__), "frontend/index.html")

    with open(file_path, "r", encoding="utf-8") as f:
        html_content = f.read()

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "text/html"
        },
        "body": html_content
    }
```

---

## 5. Terraform Did Not Detect Changes

### Issue

terraform apply did not update Lambda after changes.

### Cause

No change detected in deployment package or state.

### Fix

Force update:

```
terraform apply -replace="aws_lambda_function.<function_name>"
```

---

## Summary

* Do not commit .terraform folder
* Always rebuild function.zip after code changes
* Ensure correct file paths in packaging
* Terraform updates depend on state or file changes
