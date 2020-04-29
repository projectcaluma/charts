#/bin/bash

TARGETDIR=$GITHUB_WORKSPACE/bin
HELM_DOCS_VERSION="0.12.0"

mkdir -p $TARGETDIR

curl -L -o - https://github.com/norwoodj/helm-docs/releases/download/v$HELM_DOCS_VERSION/helm-docs_${HELM_DOCS_VERSION}_Linux_x86_64.tar.gz | tar -C $TARGETDIR -zxf -

echo "::add-path::$TARGETDIR"
