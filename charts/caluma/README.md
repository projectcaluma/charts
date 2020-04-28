caluma
======
A collaborative form editing service.

Current chart version is `0.9.3`

Source code can be found [here](https://caluma.io/)

## Chart Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://kubernetes-charts.storage.googleapis.com/ | minio | 2.x.x |
| https://kubernetes-charts.storage.googleapis.com/ | postgresql | 6.x.x |

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| allowedHosts | string | `"*"` |  |
| backend.additionalEnvironment | list | `[]` |  |
| frontend.additionalEnvironment | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.backend.pullPolicy | string | `"IfNotPresent"` |  |
| image.backend.repository | string | `"projectcaluma/caluma"` |  |
| image.frontend.pullPolicy | string | `"IfNotPresent"` |  |
| image.frontend.repository | string | `"projectcaluma/caluma-demo"` |  |
| image.frontend.tag | string | `"stable"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"caluma.chart-example.local"` |  |
| ingress.tls | list | `[]` |  |
| minio.accessKey | string | `""` |  |
| minio.defaultBucket.enabled | bool | `true` |  |
| minio.defaultBucket.name | string | `"caluma-media"` |  |
| minio.enabled | bool | `false` |  |
| minio.ingress.annotations | object | `{}` |  |
| minio.ingress.enabled | bool | `true` |  |
| minio.ingress.hosts[0] | string | `"caluma.chart-example.local"` |  |
| minio.ingress.tls | list | `[]` |  |
| minio.secretKey | string | `""` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.initdbScripts."create_extension_hstore.sh" | string | script that switches the socket to trusted to configure hstore | script to initialize hstore |
| postgresql.postgresqlDatabase | string | `"caluma"` |  |
| postgresql.postgresqlPassword | string | `"CHANGEME"` |  |
| postgresql.postgresqlUsername | string | `"caluma"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| secretKey | string | `"SUPERSECRET"` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |
