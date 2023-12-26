# Helm-Charts for GoToSocial

This repo contains (unofficial) helm charts for the official GoToSocial docker images.

## Installation

For all currently available options have a look at the `values.yaml`. If you are missing an option, please feel free to open an issue/PR.


After installing GoToSocial for the first time, you must create a user by attaching a terminal to the pod and execute the commands as described in the [documentation for docker](https://docs.gotosocial.org/en/latest/getting_started/user_creation)


### Example Configuration

```yaml
host: 
  name: your-domain.com
timezone: "Europe/Berlin"


ingress:
  enabled: true
  annotations:
    cert-manager.io/cluster-issuer: "letsencrypt-prod"
  hosts:
  - host: your-domain.com
    paths:
      - path: /
        pathType: Prefix
  tls: 
  - secretName: gotosocial-cert
    hosts:
    - your-domain.com
```

## TODO

- publish the chart
- add integration tests?
