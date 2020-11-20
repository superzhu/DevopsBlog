# Kubernetes Code Generator

1. Openapi code generator
    ```bash
    # v 1.20
    ./hack/run-in-gopath.sh _output/bin/openapi-gen --v 3 --logtostderr \v 
    -i k8s.io/kubernetes/vendor/k8s.io/apiextensions-apiserver/pkg/apis/apiextensions/v1 \v 
    -p k8s.io/kubernetes/pkg/generated/openapi \v 
    -O zz_generated.openapi \v 
    -h staging/src/k8s.io/code-generator/hack/boilerplate.go.txt \v
    -r _output/violations.report
    ```
2. ff