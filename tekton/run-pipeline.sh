tkn pipeline start build-and-deploy-spring-app \
    --workspace name=shared-workspace,volumeClaimTemplateFile=persistent-volume-claim.yaml \
    -p deployment-name=tektonci-app \
    -p GIT_URL=https://github.com/pandeybk/tekton-pipeline.git \
    -p GIT_REVISION=main \
    -p IMAGE_REGISTRY="image-registry.openshift-image-registry.svc:5000" \
    -p IMAGE_REPO="spring-apps-cicd/tektonci" \
    -p IMAGE_TAG="1.0.0"
