# Enterprise Azure Landing Zone - Management Group Hierarchy

Target Path: `/mnt/d/tf/scratch` (Windows: `D:\tf\scratch`)

This directory contains the production-grade Terraform implementation for the **Management Group Hierarchy** phase of an Enterprise Azure Landing Zone, structured in accordance with Microsoft's Cloud Adoption Framework (CAF) Enterprise-Scale architecture.

---

## 🏗️ Architecture Hierarchy

```
Tenant Root Group (or Custom Parent MG)
 └── [mg-{root_id}] Intermediate Root Management Group
      ├── [mg-{root_id}-platform] Platform
      │    ├── [mg-{root_id}-platform-management] Management & Monitoring
      │    ├── [mg-{root_id}-platform-connectivity] Connectivity & Networking
      │    └── [mg-{root_id}-platform-identity] Identity & Access
      ├── [mg-{root_id}-landingzones] Workloads / Landing Zones
      │    ├── [mg-{root_id}-workloads-corp] Corporate / Internal Workloads
      │    ├── [mg-{root_id}-workloads-online] Online / Public-Facing Workloads
      │    └── [mg-{root_id}-workloads-nonprod] Non-Production / Staging Workloads
      ├── [mg-{root_id}-sandbox] Sandbox
      └── [mg-{root_id}-decommissioned] Decommissioned / Legacy
```

---

## 📋 Features & Design Principles

- **Location Path**: Deployed at `/mnt/d/tf/scratch` (Windows: `D:\tf\scratch`).
- **Modular Design**: Core logic isolated in `modules/management_groups` for reuse and maintainability.
- **Production Naming Conventions**: Standardized prefixing `mg-${var.root_id}-...` with clean, human-readable display names.
- **No Hardcoded Tenant IDs**: Tenant ID is dynamically discovered using `data.azurerm_client_config.current.tenant_id`.
- **Configurable Parameters**: Parameterized prefix (`root_id`), root display name (`root_name`), parent group overrides, and subscription placement mapping.
- **Scope Scoped to MG Phase**: Excludes networking (VNets/Firewalls) and workload resources as required for phase 1 initialization.

---

## 🔑 Dependencies and Assumptions

1. **Authentication & Authorization**:
   - Executing principal (User or Service Principal) must possess **Management Group Contributor** or **Owner** role at the Tenant Root Group level (or target parent MG level).
2. **Resource Provider Registration**:
   - `Microsoft.Management` resource provider must be registered in the Azure Tenant context.
3. **Terraform CLI**:
   - Terraform CLI version `>= 1.5.0` and AzureRM Provider `~> 3.0`.

---

## 🚀 Deployment Instructions

### 1. Working Directory
```bash
cd /mnt/d/tf/scratch
```

### 2. Initialize Working Directory
```bash
terraform init
```

### 3. Configure Variables
Copy `terraform.tfvars.example` to `terraform.tfvars` and adjust values:
```bash
cp terraform.tfvars.example terraform.tfvars
```

### 4. Validate Configuration
```bash
terraform validate
```

### 5. Review Execution Plan
```bash
terraform plan
```

---

## 📄 File Index (at `/mnt/d/tf/scratch`)

- `versions.tf`: Required Terraform and provider version bounds.
- `providers.tf`: AzureRM provider declaration and dynamic client config data source.
- `variables.tf`: Configurable inputs for hierarchy customization.
- `main.tf`: Root configuration calling the management group sub-module.
- `outputs.tf`: Exports created MG IDs, names, and structural relationships.
- `modules/management_groups/`: Sub-module encapsulating `azurerm_management_group` resource graph.
