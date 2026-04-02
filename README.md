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

The workflow always evaluates the current device state and reports two separate outcomes:

- Workflow `PASS`: the playbook ran successfully
- Workflow `FAIL`: the playbook did not run correctly or no report was produced
- Compliance `PASS`: no violations were found
- Compliance `FAIL`: one or more violations were found

Each run also uploads `compliance-report.json` and `ansible-playbook.log` as artifacts and writes a human-readable summary to the GitHub Actions job summary, including an execution log excerpt when the playbook fails.

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

## License

Apache-2.0. See [LICENSE](LICENSE).
