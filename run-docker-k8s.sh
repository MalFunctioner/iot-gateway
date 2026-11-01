#!/usr/bin/env bash
# Run on your Mac from inside iot-gateway/ (needs Docker Desktop + minikube/kind or Docker Desktop K8s)
set -e
echo "== Task 4: Docker =="
docker build -t iot-hub:latest .
docker run --rm iot-hub:latest echo "Smart Hub Online"
docker rm -f iot-hub 2>/dev/null || true
docker run -d --name iot-hub -p 8088:80 iot-hub:latest
docker logs iot-hub
docker ps --filter name=iot-hub
curl -s http://localhost:8088

echo "== Task 5: Kubernetes =="
kubectl apply -f k8s/deployment.yaml -f k8s/service.yaml
kubectl rollout status deployment/iot-core
kubectl get pods -l service=iot-core -o wide
kubectl get svc iot-core-svc
