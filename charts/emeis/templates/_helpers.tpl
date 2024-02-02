{{/*
Expand the name of the chart.
*/}}
{{- define "emeis.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "emeis.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "emeis.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "emeis.labels" -}}
helm.sh/chart: {{ include "emeis.chart" . }}
{{ include "emeis.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "emeis.selectorLabels" -}}
app.kubernetes.io/name: {{ include "emeis.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "emeis.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "emeis.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Define the contents for the emeis ConfigMap
*/}}
{{- define "emeis.configMap" -}}
ENV: {{ .Values.emeis.env | quote }}
ALLOWED_HOSTS: {{ .Values.emeis.allowedHosts | quote }}
ALLOW_ANONYMOUS_WRITE: {{ .Values.emeis.allowAnonymousWrite | quote }}
LANGUAGES: {{ join "," .Values.emeis.languages | quote}}
VISIBILITY_CLASSES: {{ .Values.emeis.visibilityClasses | quote }}
PERMISSION_CLASSES: {{ .Values.emeis.permissionClasses | quote }}
{{- if and .Values.postgresql.enabled .Values.emeis.postgresql.existingHost }}
{{ fail "postgresql.enabled and emeis.postgresql.existingHost are mutually exclusive, please pick one" }}
{{- end }}
{{- if .Values.postgresql.enabled }}
DATABASE_HOST: {{ template "emeis.fullname" . }}-postgresql
{{- else if .Values.emeis.postgresql.existingHost }}
DATABASE_HOST: {{ .Values.emeis.postgresql.existingHost | quote }}
{{- else }}
{{ fail "neither postgresql.enabled or emeis.postgresql.existingHost are set, please pick one" }}
{{- end }}
{{- if .Values.postgresql.enabled }}
DATABASE_NAME: "{{ .Values.postgresql.auth.database }}"
{{- else }}
DATABASE_NAME: "{{ .Values.emeis.postgresql.database }}"
{{- end }}
{{- if .Values.postgresql.enabled }}
DATABASE_USER: "{{ .Values.postgresql.auth.username }}"
{{- else }}
DATABASE_USER: "{{ .Values.emeis.postgresql.username }}"
{{- end }}
{{- end }}

{{/*
Define the contents for the emeis Secret
*/}}
{{- define "emeis.secret" -}}
SECRET_KEY: {{ .Values.emeis.secretKey | b64enc | quote }}
{{- end }}
