# Autoinstrumentacion con Opentelemetry y Odigos en K8s

VER https://medium.com/@edeNFed/how-to-build-an-end-to-end-open-source-observability-solution-on-kubernetes-c8725c016dd5

- Crear Cluster con Minikube
- [Backend de Observabilidad - Grafana+Prometheus+Tempo+Loki](OBS-Backend.md)
- Desplegar Odigos en K8s
    - [Odigos OPCION 1 (HELM chart)](Odigos.md)
    - [Odigos OPCION 2 (Nueva Versión con CLI)](Odigos_v2.md)
- Desplegar app
    - Crear namespace
    kubectl create namespace app
    - Copiar imagen local a minikube
    minikube image load registry.gitlab.com/telecom-argentina/coo/flow/op/taskmanager-flow:opentelemetry-auto_947572262
    - Desplegar app
    kubectl apply -k app/taskmanager/ -n app

    * App de prueba
    kubectl apply -f https://raw.githubusercontent.com/keyval-dev/bank-of-athnos/main/release/kubernetes-manifests.yaml

- Instrumentar
    - Ir a Odigos
    kubectl port-forward svc/odigos-ui 3000:3000 -n odigos-system

    http://localhost:3000

    - Seleccionar el namespace app
    - Seleccioanar los destinos (Ver Backend Observabilidad)

- [Simular Carga](Predator_Loader.md)


