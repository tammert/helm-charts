.PHONY: deploy_replicant
deploy_replicant:
	helm upgrade --install --create-namespace -n replicant -f replicant/values.yaml -f replicant/secrets.yaml replicant replicant/

.PHONY: release_replicant
release_replicant:
	git pull
	cr package replicant/
	cr upload --config ~/.cr.yaml
	cr index --config ~/.cr.yaml --push
	rm .cr-release-packages/*
