
* docker build --no-cache -t django-app:v1 .

* docker build --no-cache -t django-proxy:v1 proxy/

* docker save django-app:v1 -o django-app.tar

* docker save django-proxy:v1 -o django-proxy.tar

* minikube image load django-app.tar

* minikube image load django-proxy.tar




* docker tag django-app:v1 mohammed3120/django-app:v1

* docker tag django-proxy:v1 mohammed3120/django-proxy:v1

* docker push mohammed3120/django-app:v1

* docker push mohammed3120/django-proxy:v1



