# PostHog TSL Setup

## Update Values
1. Update domain names in `values.yaml`.

## Setting up TLS   
```sh
helm repo add posthog https://posthog.github.io/charts-clickhouse/
helm repo update
helm upgrade -f values.yaml --timeout 20m --namespace posthog posthog posthog/posthog --atomic --wait --wait-for-jobs --debug
kubectl apply -f cluster-issuer.yaml
```

## Check Host
    
```sh
bash getHost.sh
```
