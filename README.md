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

## Notes

This is intended as a small proof repo. It uses a public GitHub Actions runner and targets a reachable Cisco DevNet Sandbox over SSH.
