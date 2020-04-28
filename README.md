# Caluma Helm Charts

![Release Charts](https://github.com/projectcaluma/charts/workflows/Release%20Charts/badge.svg)

This repository contains [Helm](https://helm.sh/) charts for [Caluma](https://caluma.io).

## Usage

### Install the Helm chart repository

```bash
helm repo add caluma https://charts.caluma.io
```

### Find Helm charts to deploy

```bash
helm search repo caluma
```

## Development

### pre-commit hook

This project uses [pre-commit](https://pre-commit.com/) to automate some tasks like
generating README files.

#### pre-commit requirements

* [helm-docs](https://github.com/norwoodj/helm-docs)

#### pre-commit configuration

```bash
pre-commit install
pre-commit install-hooks
```

## License

This Helm chart collection is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free Software Foundation,
version 3 of the License.
