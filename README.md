# Cisco AAP Compliance Demo

This repository demonstrates three Cisco IOS compliance checks implemented natively in Ansible:

- SW-001: Native VLAN is not VLAN 1 on enabled trunk interfaces
- SW-002: Shutdown access interfaces must be assigned to VLAN 999
- GEN-001: Hostname matches naming convention

## Required GitHub Secrets

Add these repository secrets before running the workflow:

- `SANDBOX_HOST`
- `SANDBOX_USER`
- `SANDBOX_PASSWORD`

## Run

Use **Actions** → **Test Cisco IOS compliance demo** → **Run workflow**.

The workflow has a **fail_on_noncompliance** input:

- `false` (default): report findings but do not fail the job
- `true`: fail the job when any control is non-compliant

Workflow file: [.github/workflows/sandbox-test.yml](.github/workflows/sandbox-test.yml)

## Local linting with pre-commit

One-command setup (recommended):

```bash
./scripts/bootstrap-dev.sh
```

Script file: [scripts/bootstrap-dev.sh](scripts/bootstrap-dev.sh)

Setup only (skip running checks):

```bash
./scripts/bootstrap-dev.sh --no-run
```

Install tooling:

```bash
python3 -m pip install --upgrade pre-commit ansible-lint yamllint
```

Enable hooks for this repo:

```bash
pre-commit install
```

Run checks on all files:

```bash
pre-commit run --all-files
```

## Notes

This is intended as a small proof repo. It uses a public GitHub Actions runner and targets a reachable Cisco DevNet Sandbox over SSH.
