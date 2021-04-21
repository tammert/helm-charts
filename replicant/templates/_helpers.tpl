{{- define "replicant.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "replicant.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "replicant.labels" -}}
helm.sh/chart: {{ include "replicant.chart" . }}
{{ include "replicant.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.additionalLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{- define "replicant.selectorLabels" -}}
app.kubernetes.io/name: {{ include "replicant.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "replicant.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "replicant.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
