Module designed to help run automated restarts of applications in k8s

A requirement has developed to periodically restart pods in aggregation abstraction layers due to unusual edge cases.

This is often achieved by using the liveness_probe and then adjusting the behavioru to trigger, however this relies on the liveness probe not being used elsewhere in k8s as an actual liveness probe.

This module creates a service account, grants it specific access to the deployment/statefulset/daemonset for invoking `kubectl rollout restart` and provisions a cronjob to restart it.
