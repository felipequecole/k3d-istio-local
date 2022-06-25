# Create k3d cluster
# k3d cluster create local-mesh --servers 1 --agents 2 --port 9080:80@loadbalancer --port 9443:443@loadbalancer --api-port 6443 --k3s-arg "--disable=traefik@server:0"
echo "Creating k3d cluster"
k3d cluster create --config ./k3d-cluster-config.yaml

echo "Installing istio"
# install istio
istioctl install --set profile=demo 

echo "Labeling default namespace to auto-enable sidecars"
# Apply label to default namespace
kubectl label namespace default istio-injection=enabled

echo "Creating local Istio Gateway"
# Apply gateway
kubectl apply -f local-gw.yaml

echo "You now have a local service mesh running!"
echo "To make images available for your Kubernetes, just use your local registry"
echo "docker tag localhost:5000/image-name:latest && docker push localhost:5000/image-name:latest"
