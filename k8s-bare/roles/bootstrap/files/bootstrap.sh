[ -z "$1" ] && { 
    KUBE_APISERVER=`kubectl config view  --output=jsonpath='{.clusters[].cluster.server}' | head -n1 `
} || KUBE_APISERVER=$1

TOKEN_PUB=$(openssl rand -hex 3)
TOKEN_SECRET=$(openssl rand -hex 8)
BOOTSTRAP_TOKEN="${TOKEN_PUB}.${TOKEN_SECRET}"

# Generate bootstrap token secret
kubectl -n kube-system create secret generic bootstrap-token-${TOKEN_PUB} \
        --type 'bootstrap.kubernetes.io/token' \
        --from-literal description="cluster bootstrap token" \
        --from-literal token-id=${TOKEN_PUB} \
        --from-literal token-secret=${TOKEN_SECRET} \
        --from-literal usage-bootstrap-authentication=true \
        --from-literal usage-bootstrap-signing=true


CLUSTER_NAME="kubernetes"
KUBE_USER="kubelet-bootstrap"
KUBE_CONFIG="bootstrap.kubeconfig"


# set cluster parameters
kubectl config set-cluster ${CLUSTER_NAME} \
  --certificate-authority=/etc/kubernetes/pki/ca.crt \
  --embed-certs=true \
  --server=${KUBE_APISERVER} \
  --kubeconfig=/etc/kubernetes/${KUBE_CONFIG}


# set context parameter
kubectl config set-context ${KUBE_USER}@${CLUSTER_NAME} \
  --cluster=${CLUSTER_NAME} \
  --user=${KUBE_USER} \
  --kubeconfig=/etc/kubernetes/${KUBE_CONFIG}


# set client authentication parameter
kubectl config set-credentials ${KUBE_USER} \
  --token=${BOOTSTRAP_TOKEN} \
  --kubeconfig=/etc/kubernetes/${KUBE_CONFIG}



# set current context
kubectl config use-context ${KUBE_USER}@${CLUSTER_NAME} --kubeconfig=/etc/kubernetes/${KUBE_CONFIG}


# create a ClusterRoleBinding that binds the system:bootstrappers group to the cluster role system:node-bootstrapper
kubectl create clusterrolebinding kubeadm:kubelet-bootstrap \
        --clusterrole system:node-bootstrapper --group system:bootstrappers


# To enable the kubelet to request and receive a new certificate, create a 
# ClusterRoleBinding that binds the group in which the bootstrapping node 
# is a member system:bootstrappers to the ClusterRole that grants it permission, 
# system:certificates.k8s.io:certificatesigningrequests:nodeclient
cat <<EOF | kubectl apply -f -
# Approve all CSRs for the group "system:bootstrappers"
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: auto-approve-csrs-for-group
subjects:
- kind: Group
  name: system:bootstrappers
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: system:certificates.k8s.io:certificatesigningrequests:nodeclient
  apiGroup: rbac.authorization.k8s.io
EOF


# To enable the kubelet to renew its own client certificate, create a ClusterRoleBinding 
# that binds the group in which the fully functioning node is a member system:nodes to the 
# ClusterRole that grants it permission, system:certificates.k8s.io:certificatesigningrequests:selfnodeclient
cat <<EOF | kubectl apply -f -
# Approve renewal CSRs for the group "system:nodes"
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: auto-approve-renewals-for-nodes
subjects:
- kind: Group
  name: system:nodes
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: system:certificates.k8s.io:certificatesigningrequests:selfnodeclient
  apiGroup: rbac.authorization.k8s.io
EOF

