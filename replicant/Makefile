.PHONY: template
template:
	helm template -f values.yaml replicant ./

.PHONY: template-test
template-test:
	helm template -f values.yaml replicant ./ | kubectl apply -f- --dry-run=server
