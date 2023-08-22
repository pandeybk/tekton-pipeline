```
oc policy add-role-to-user system:image-builder system:serviceaccount:tektonci:pipeline
oc policy add-role-to-user system:image-puller system:serviceaccount:tektonci:pipeline
oc policy add-role-to-user system:image-pusher system:serviceaccount:tektonci:pipeline
```