# Local setup for Service Mesh (istio)

## Pre-requisites:

- [Docker](https://docs.docker.com/engine/install/) 
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [k3d](https://k3d.io/)
- [istioctl](https://istio.io/latest/docs/setup/install/istioctl/)

## How to install

Run `sudo ./boot-mesh.sh`, that will create a k3d cluster with 2 nodes, install istio and setup a local gateway (mapping cluster port 80 to localhost 8080)
It will also create a local registry, that you can use to push your images

```
docker tag localhost:5000/my-image:latest && docker push localhost:5000/my-image:latest
```

And it can be used in your deployments by setting your image to `k3d-registry.localhost:5000/my-image:latest`