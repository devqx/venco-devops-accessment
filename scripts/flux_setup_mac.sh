#! /usr/bin/env bash

brew install fluxcd/tap/flux

# Bash auto-completion install
. <(flux completion bash)

export GITHUB_TOKEN=${GITHUB_TOKEN}
export GITHUB_USER=${GITHUB_USER}

# Pre-flight checks
kubectl get nodes

# We ready for flux to do it's magic
flux check --pre

# Install flux into a k8s cluster

flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=venco-devops-accessment \
  --branch=main \
  --path=./deploy/frapper \
  --personal

# create the frappe namespace
kubectl create ns 