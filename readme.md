# PostHog TLS Setup

## Domain Management on Digital Ocean
[Setup DNS on DO](https://docs.digitalocean.com/products/networking/dns/quickstart/) and verify them [here](https://dnschecker.org/).

## Setup Mailing Account
Create a mailing account on [Mailgun](https://www.mailgun.com/) and setup the domain created above [here](https://help.mailgun.com/hc/en-us/articles/360026833053-Domain-Verification-Walkthrough). Verify by sending an email.

## Update Values
1. Update domain names in `values.yaml` in [L3](https://github.com/ChakshuGautam/posthog-k8s-tls/blob/37e2e0d5f1259aa85c85390866188fbcc29e638e/values.yaml#L3) and [L13](https://github.com/ChakshuGautam/posthog-k8s-tls/blob/37e2e0d5f1259aa85c85390866188fbcc29e638e/values.yaml#L13).
2. Update issuer email [here](https://github.com/ChakshuGautam/posthog-k8s-tls/blob/f287bb88267f8f683500a00986775299dd30956b/cluster-issuer.yaml#L7).

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
