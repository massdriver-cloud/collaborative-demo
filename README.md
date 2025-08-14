# Massdriver Collaborative Demo

A hands-on demonstration project showcasing Infrastructure as Code (IaC) with Massdriver. This repository contains a complete serverless REST API built on AWS using API Gateway, Lambda, and DynamoDB.

## 🏗️ Architecture

This demo implements a three-tier serverless application:

- **API Gateway** (`bundles/apigateway/`) - REST API with optional custom DNS
- **Lambda Function** (`bundles/lambda/`) - Node.js application with configurable routes  
- **DynamoDB Table** (`bundles/dynamodb/`) - NoSQL database with flexible schema

## 📁 Project Structure

```
├── bundles/                    # Massdriver infrastructure bundles
│   ├── apigateway/            # API Gateway configuration
│   ├── dynamodb/              # DynamoDB table setup
│   └── lambda/                # Lambda function (Node.js)
├── artifact-definitions/       # Custom artifact schemas
├── components/                # Reusable schema components
└── Makefile                   # Publishing automation
```

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone <repo-url>
   cd collaborative-demo
   ```

2. **Open in your favorite editor**
   ```bash
   code .  # VS Code
   # or your preferred editor
   ```

3. **Ready to collaborate!** 
   We'll explore and modify the infrastructure code together during our session.

## 💡 Demo Flow

During our session, we'll:
1. Explore the bundle configurations
2. Modify infrastructure parameters
3. Deploy components step-by-step
4. Connect the services together
5. Test the complete application

## 📝 Key Files to Explore

- `bundles/*/massdriver.yaml` - Bundle configurations and schemas
- `bundles/lambda/src/` - Lambda function source code
- `bundles/*/src/*.tf` - Terraform infrastructure definitions

## 🔍 Finding Demo Problems

Each collaborative exercise can be found by searching for `MODULE_` comments throughout the code. These mark sections where solutions are commented out - we'll uncomment and configure them together during the demo!

```bash
# Search for all demo modules
grep -r "MODULE_" bundles/
```

Ready to build some infrastructure? Let's dive in! 🎯
