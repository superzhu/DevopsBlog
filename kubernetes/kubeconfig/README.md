# kubeconfig Concepts and Operations


## Steps for extracting certificate from kubeconfig file

1. Get certificates from kubernetes cluster :
   ```shell
    kubectl config view --flatten --minify > cluster-cert.txt
   ```

2. cluster-cert.txt has "client-certificate-data" and "client-key-data" parts,
   use those from cluster-cert.txt to replace related part of old kubeconfig file
   
3. Check expiration date of certificate contained in kubeconfig file
    1. cp kubeconfig to be checked as : ~/.kube/config
    2. use attached shell script: 
       ```shell
       ./extract-cert.sh {cluster-name} {user-name}
       ```
    3. verify expiration date:      
       ```shell
         cat kubernetes-admin.crt | openssl x509 -noout -enddate
       ```