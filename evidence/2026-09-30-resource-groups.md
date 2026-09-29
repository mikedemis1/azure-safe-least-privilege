# 2026-09-30: resource groups per environment

Label: cloud-tested (2026-09-30)

Three resource groups, one per environment. Decision: [0001](../docs/decisions/0001-resource-groups-per-environment.md).

## Plan

```
$ terraform plan
...
Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + resource_group_names = {
      + dev     = "rg-lab-dev"
      + prod    = "rg-lab-prod"
      + staging = "rg-lab-staging"
    }
```

## Apply

```
$ terraform apply
...
azurerm_resource_group.env["dev"]: Creation complete after 31s [id=/subscriptions/<subscription-id>/resourceGroups/rg-lab-dev]
azurerm_resource_group.env["staging"]: Creation complete after 31s [id=/subscriptions/<subscription-id>/resourceGroups/rg-lab-staging]
azurerm_resource_group.env["prod"]: Creation complete after 31s [id=/subscriptions/<subscription-id>/resourceGroups/rg-lab-prod]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
```

The three groups were created in parallel since none depends on another.

## Check from Azure

```
$ az group list -o table
Name            Location    Status
--------------  ----------  ---------
rg-lab-prod     westeurope  Succeeded
rg-lab-dev      westeurope  Succeeded
rg-lab-staging  westeurope  Succeeded
```

## Secrets stay local

```
$ git check-ignore -v infra/lab/terraform.tfvars
.gitignore:13:*.tfvars	infra/lab/terraform.tfvars
```

The real subscription ID lives in `terraform.tfvars`, which git ignores. Only `terraform.tfvars.example` is committed.

Cost: resource groups are free.
