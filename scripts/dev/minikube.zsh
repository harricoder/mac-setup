#!/usr/bin/env zsh
#
# Ensure minikube is properly installed (and uses preferred backends, etc).
#
source ./scripts/utility/_utils.zsh

# Kubectl also gets installed via docker docker for mac.
# Ensure that the brew version is used (less conflict).
if [[ ! -h /usr/local/bin/kubectl ]];
then
  echo "Replacing docker kubectl bin with brew link..."
  rm '/usr/local/bin/kubectl'
  brew link kubernetes-cli
fi

echo "kubectl version..."
kubectl version

echo "setting minikube configs..."
minikube config set driver virtualbox
#minikube config set memory 8192

echo "minikube version..."
minikube version

echo -e "${GREEN_TICK} minikube successfully configured.${NC}"
