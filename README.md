# Helm-Charts for GoToSocial [![Build & Test Chart](https://github.com/corite/gotosocial-helm/actions/workflows/build.yml/badge.svg)](https://github.com/corite/gotosocial-helm/actions/workflows/build.yml) [![Release Chart](https://github.com/corite/gotosocial-helm/actions/workflows/release.yml/badge.svg)](https://github.com/corite/gotosocial-helm/actions/workflows/release.yml)

This repo contains (unofficial) helm charts for the official GoToSocial docker images.

## Installation

Add the repo by running 

```bash
helm repo add gotosocial-helm https://corite.dev/gotosocial-helm
```
and then install you values with

```bash
helm install gotosocial gotosocial-helm/gotosocial -f your-values.yaml
```

For all currently available options have a look at the `values.yaml`. If you are missing an option, please feel free to open an issue/PR.


After installing GoToSocial for the first time, you must create a user by attaching a terminal to the pod and execute the commands as described in the [documentation for docker](https://docs.gotosocial.org/en/latest/getting_started/user_creation)


### Example Configuration

```yaml
host: your-domain.com
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
