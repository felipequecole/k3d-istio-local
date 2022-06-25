#!/bin/bash

echo "Creating k3d cluster"
k3d cluster create --config ./k3d-cluster-config.yaml

echo "Installing istio"
istioctl install --set profile=demo 

echo "Labeling default namespace to auto-enable sidecars"
kubectl label namespace default istio-injection=enabled

echo "Creating local Istio Gateway"
kubectl apply -f local-gw.yaml

echo "You now have a local service mesh running!"
echo "To make images available for your Kubernetes, just use your local registry"
echo "docker tag localhost:5000/image-name:latest && docker push localhost:5000/image-name:latest"
