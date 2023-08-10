## Crear un *deploy token* en el repo de gitlab
user: u518765
token: douCUfSwg8Eso5z8j6C8

## Descargar la imagen
docker login -u u518765 -p douCUfSwg8Eso5z8j6C8 registry.gitlab.com/telecom-argentina/coo/flow/op/taskmanager-flow

## Cargarla en minikube
minikube docker-env
eval $(minikube -p minikube docker-env)

### VER imagenes en minikube: 
minikube image ls --format table

minikube image load registry.gitlab.com/telecom-argentina/coo/flow/op/taskmanager-flow:opentelemetry-auto_947572262

## Usarla en el deployment sin descargar
    ...
    spec:
      containers:
      - image: registry.gitlab.com/telecom-argentina/coo/flow/op/taskmanager-flow:opentelemetry-auto_947572262
        name: taskmanager
        imagePullPolicy: Never
    ...