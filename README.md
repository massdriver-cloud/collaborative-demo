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
└── Makefile                   # Publishing automation and project setup
```

## 🛠️ Makefile Commands

The project includes a Makefile with several useful commands:

- `make project` - Create a new Massdriver project with environment and packages
  - Default project name: `cdMMDD` (e.g., `cd1205` for December 5th)
  - Custom name: `make project PROJECT_NAME=my-project`
  - Creates packages with bundles: `aws-collab-apigateway`, `aws-collab-dynamodb`, `aws-collab-lambda`
- `make publish-bundles` - Publish all bundles to Massdriver
- `make publish-artifacts` - Publish all artifact definitions
- `make all` - Publish everything and create project (default target)
- `make clean` - Remove generated schema JSON files
- `make help` - Show all available commands

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone <repo-url>
   cd collaborative-demo
   ```

2. **Create a Massdriver project** (optional)
   ```bash
   # Create a project with default name (cdMMDD where MMDD is current month/day)
   make project
   
   # Or specify a custom project name
   make project PROJECT_NAME=my-demo-project
   ```
   This will:
   - Delete any existing project with the same name (if it exists)
   - Create a new Massdriver project with name "🧪 Collaborative Demo {PROJECT_NAME}"
   - Create a staging environment
   - Create packages for apigateway, dynamodb, and lambda with their respective bundles

3. **Open in your favorite editor**
   ```bash
   code .  # VS Code
   # or your preferred editor
   ```

4. **Ready to collaborate!** 
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

## 📋 Self-Service and IaC Adoption Problems

| Module ID | Problem | Solution |
|-----------|---------|----------|
| **MODULE_1.1** | Developers struggle to determine appropriate configuration values without guidance, causing decision fatigue and delayed setup. | Example presets demonstrate common use cases as templates, reducing cognitive load. |
| **MODULE_1.2** | IaC tools don't indicate when dependent fields are required, leading to confusion and configuration errors. | JSON Schema dependencies conditionally display fields based on user selections, preventing invalid configurations. |
| **MODULE_1.3** | When configuring IaC, developers can enter any value and may select non-compliant or inappropriate options, resulting in policy violations. | Enum constraints restrict selections to approved options, enforcing organizational policies. |
| **MODULE_1.4** | When modifying IaC, developers accidentally change fields that trigger resource recreation, causing outages. | Mark critical fields as immutable after initial creation, preventing accidental resource recreation. |
| **MODULE_2.3** | Developers deploy infrastructure with security vulnerabilities that go undetected until production. | Checkov security scanning with conditional deployment halts catches vulnerabilities before production. |
| **MODULE_2.1** | When alerts fire, developers can't determine appropriate thresholds or trace them back to the infrastructure code. | CloudWatch metric alarms in infrastructure code with sensible defaults enable quick troubleshooting. |
| **MODULE_2.2** | When infrastructure issues occur, developers don't know how to diagnose problems and must escalate to operations teams. | Operator runbooks with monitoring commands and troubleshooting steps enable self-service operations. |
| **MODULE_2.4** | Developers don't know infrastructure costs until bills arrive, causing unexpected budget overruns. | Budget tracking modules monitor forecasted costs and send alerts when approaching limits. |
| **MODULE_3.1** | When connecting IaC modules, developers must manually copy configuration data between them, which is error-prone. | Dynamic enums and artifacts automate data passing between modules, eliminating manual transfer errors. |

