tkn pipeline start tektonci-app \
    --workspace name=shared-workspace,volumeClaimTemplateFile=persistent-volume-claim.yaml \
    -p IMAGE_TAG="1.0.0" \
    --use-param-defaults 
