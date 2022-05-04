POSTHOG_IP=$(kubectl get --namespace posthog ingress posthog -o jsonpath="{.status.loadBalancer.ingress[0].ip}" 2> /dev/null)
POSTHOG_HOSTNAME=$(kubectl get --namespace posthog ingress posthog -o jsonpath="{.status.loadBalancer.ingress[0].hostname}" 2> /dev/null)
if [ -n "$POSTHOG_IP" ]; then
    POSTHOG_INSTALLATION=$POSTHOG_IP
fi
if [ -n "$POSTHOG_HOSTNAME" ]; then
    POSTHOG_INSTALLATION=$POSTHOG_HOSTNAME
fi

if [ ! -z "$POSTHOG_INSTALLATION" ]; then
    echo -e "\n----\nYour PostHog installation is available at: http://${POSTHOG_INSTALLATION}\n----\n"
else
    echo -e "\n----\nUnable to find the address of your PostHog installation\n----\n"
fi