#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "Usage: $0 <env> [plan|apply|destroy|init]"
	echo "  env: prod | staging | dev"
	exit 1
}

ENV_NAME="${1:-}"
ACTION="${2:-plan}"

if [[ -z "$ENV_NAME" ]]; then
	usage
fi

case "$ENV_NAME" in
	prod)
		BACKEND_FILE="backend-prod.hcl"
		TFVARS_FILE="env/prod.tfvars"
		;;
	staging)
		BACKEND_FILE="backend-staging.hcl"
		TFVARS_FILE="env/staging.tfvars"
		;;
	dev)
		BACKEND_FILE="backend-dev.hcl"
		TFVARS_FILE="env/dev.tfvars"
		;;
	*)
		echo "Unknown env: $ENV_NAME"
		usage
		;;
esac

if [[ ! -f "$BACKEND_FILE" ]]; then
	echo "Missing backend file: $BACKEND_FILE"
	exit 1
fi

if [[ "$ACTION" != "init" && ! -f "$TFVARS_FILE" ]]; then
	echo "Missing tfvars file: $TFVARS_FILE"
	exit 1
fi

terraform init -backend-config="$BACKEND_FILE" -reconfigure

case "$ACTION" in
	init)
		;;
	plan)
		terraform plan -var-file="$TFVARS_FILE"
		;;
	apply)
		terraform apply -var-file="$TFVARS_FILE"
		;;
	destroy)
		terraform destroy -var-file="$TFVARS_FILE"
		;;
	*)
		echo "Unknown action: $ACTION"
		usage
		;;
esac
