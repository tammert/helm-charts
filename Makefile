.PHONY: deploy_replicant
deploy_replicant:
	helm upgrade --install --create-namespace -n replicant -f replicant/values.yaml -f replicant/secrets.yaml replicant replicant/
