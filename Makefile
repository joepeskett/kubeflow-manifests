ENV ?= dev

hydrate:
		rm -rf .build/
		mkdir -p ./build/
		#Build Jupyter Web App
		mkdir -p ./build/jupyter-web-app
		kustomize build --load_restrictor none -o ./build/jupyter-web-app ./manifests/jupyter/jupyter-web-app/base_v3/
		#Build Notebook controller
		mkdir -p ./build/notebook-controller
		kustomize build --load_restrictor none -o ./build/notebook-controller ./manifests/jupyter/notebook-controller/base_v3
		#Build Istio
		#Build Istio-crds
		#Build Istio-install
		#Build Application
		#Build Application-crds
		#


apply: hydrate

		kubectl apply -f ./build/jupyter-web-app
