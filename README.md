# azure-safe-least-privilege

Status: 🚧 week 1, building the Azure lab. Nothing below is implemented yet.

A tool that shrinks the permissions of Azure machine identities (service principals and managed identities) without breaking the workloads that use them.

The plan:

1. Read what each identity actually did, from Azure logs.
2. Propose a smaller role as a pull request.
3. Roll it out dev, then staging, then prod.
4. In staging, run every job path first, including rare ones like a quarterly report.
5. Watch for `AuthorizationFailed` errors and roll back automatically.
6. Write an evidence report for audits (ISO 27001, DORA).

## Prior art

This is a known problem and others have worked on it:

- **AWS IAM Access Analyzer** generates policies from CloudTrail activity.
- **Netflix Repokid** (AWS) removes unused permissions.
- **Microsoft Defender for Cloud (CIEM)** finds unused and excess permissions on Azure identities, with a 45-day lookback. Fixing them is left to you.

I'm building the full chain on Azure to learn how to do the removal step safely: what to check before a role gets smaller, and how to undo it when something breaks.

## Lab

The test environment is a fictional company. The scenario is inspired by public incidents.
