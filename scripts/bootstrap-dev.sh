#!/usr/bin/env bash
set -euo pipefail

# Bootstrap local dev linting tools for this repository.
# Usage:
#   ./scripts/bootstrap-dev.sh
#   ./scripts/bootstrap-dev.sh --no-run

RUN_CHECKS=true
if [[ "${1:-}" == "--no-run" ]]; then
  RUN_CHECKS=false
fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: python3 is required but was not found in PATH."
  exit 1
fi

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

if [[ ! -d .venv ]]; then
  echo "Creating virtual environment in .venv"
  python3 -m venv .venv
fi

# shellcheck disable=SC1091
source .venv/bin/activate

echo "Installing tooling in .venv"
python -m pip install --upgrade pip pre-commit ansible-lint yamllint

echo "Installing pre-commit hooks"
pre-commit install

if [[ "$RUN_CHECKS" == true ]]; then
  echo "Running all pre-commit checks"
  pre-commit run --all-files
else
  echo "Skipping pre-commit run (--no-run)"
fi

echo "Bootstrap complete."
