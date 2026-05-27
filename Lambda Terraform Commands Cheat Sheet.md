# 🚀 Lambda + Terraform Update Commands Cheat Sheet

This file contains all essential commands to manage updates in your AWS Lambda + Terraform project after making changes in `handler.py` or `frontend/index.html`.

---

# 📁 1. Go to Lambda folder

```bash
cd "C:\Users\AFS Computer\Desktop\api serverless\lambda"
```

---

# 🧹 2. Delete old build file (optional but recommended)

```powershell
Remove-Item function.zip -Force
```

---

# 📦 3. Rebuild Lambda package

## If frontend is inside lambda folder

```powershell
Compress-Archive -Path handler.py, ..\frontend -DestinationPath function.zip -Force
```

## If frontend is outside lambda folder

```powershell
Compress-Archive -Path handler.py, ..\frontend -DestinationPath function.zip -Force
```

---

# 📁 4. Move to Terraform folder

```bash
cd ..\terraform
```

---

# 🔍 5. Preview changes

```bash
terraform plan
```

---

# 🚀 6. Apply changes

```bash
terraform apply
```

### Auto-approve version

```bash
terraform apply -auto-approve
```

---

# 🔄 7. Force update Lambda (if changes not detected)

## Replace resource

```bash
terraform apply -replace="aws_lambda_function.<your_lambda_name>"
```

## OR taint method

```bash
terraform taint aws_lambda_function.<your_lambda_name>
terraform apply
```

---

# 🧪 8. Verify ZIP contents (debug)

```powershell
Expand-Archive function.zip -DestinationPath test
```

Expected structure:

```
test/
├── handler.py
└── frontend/
    └── index.html
```

---

# ⚠️ Common Mistakes

* Not rebuilding `function.zip` after code changes
* Wrong path for `frontend` folder
* Running Terraform outside `terraform/` directory
* Forgetting `-Force` when updating ZIP

---

# ⚡ Recommended Workflow

```bash
# 1. Rebuild package
Compress-Archive -Path handler.py, frontend -DestinationPath function.zip -Force

# 2. Go to Terraform folder
cd ..\terraform

# 3. Plan changes
terraform plan

# 4. Apply changes
terraform apply
```

---

# 🚀 Done

Use this file every time you update Lambda code or frontend files.
