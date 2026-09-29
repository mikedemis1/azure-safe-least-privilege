# 0001: Resource groups per environment, not subscriptions

Date: 2026-09-30
Status: accepted

## Decision

The lab uses one subscription with three resource groups: `rg-lab-dev`, `rg-lab-staging`, `rg-lab-prod`.

## Context

Microsoft's landing zone guidance separates dev, test and prod into different subscriptions. Separate subscriptions give separate bills, separate quotas, and a harder boundary: a role assigned at subscription scope stays inside one environment.

The lab has one subscription, and its free credits only cover that one. Extra subscriptions would bill from day one and add budgets and setup to watch.

## Consequences

- Shrinking a role works the same way at any scope, so the tool's core logic is not affected.
- The tool's plumbing is simpler than in a real company: one Activity Log, one subscription to read. Scope is always passed in as input and never hard-coded, so more subscriptions can be added later.
- A role at subscription scope reaches all three environments. That makes the over-privileged payouts identity worse, which the demo uses.
- Not tested: multi-subscription setups. The README says so.

Reference: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-management-groups
