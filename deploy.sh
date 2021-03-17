make bundle-build BUNDLE_IMG=quay.io/ccrum/assisted-service-operator-bundle:0.0.1
podman push quay.io/ccrum/assisted-service-operator-bundle:0.0.1

opm index add --bundles quay.io/ccrum/assisted-service-operator-bundle:0.0.1 --tag quay.io/ccrum/ccrum-assisted-service-index:0.0.1
podman push quay.io/ccrum/ccrum-assisted-service-index:0.0.1

oc apply -f namespace.yaml
oc apply -f postgres-pvc.yaml
oc apply -f s3-pvc.yaml
oc apply -f catalog-source.yaml
#oc apply -f subscription.yaml
