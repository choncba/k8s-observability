# Predator - REST API Loader
https://predator.dev/#home

## Instalacion en K8s
Helm Chart: https://artifacthub.io/packages/helm/zooz/predator
- helm repo add zooz https://zooz.github.io/helm/
- helm install predator zooz/predator -n predator --create-namespace
- Forwardear puerto y acceder a la UI