{{- define "gotosocial.env" -}}
env:
- name: GTS_HOST
  value: {{ .Values.host.name | quote }}
- name: GTS_BIND_ADDRESS
  value: {{ .Values.host.address | quote }}
- name: TZ
  value: {{ .Values.timezone | quote }}
- name: GTS_DB_TYPE
  value: {{ .Values.db.type | quote }}
- name: GTS_DB_ADDRESS
  value: {{ .Values.db.address | quote }}

{{- if .Values.ingress.enabled }}
- name: GTS_TRUSTED_PROXIES
  value: 0.0.0.0/0
- name: GTS_LETSENCRYPT_ENABLED
  value: "false"
{{- else -}}
- name: GTS_LETSENCRYPT_ENABLED
  value: {{ .Values.tls.enabled | quote }}
- name: GTS_LETSENCRYPT_EMAIL_ADDRESS
  value: {{ .Values.tls.email | quote }}
{{- end }}

{{- end -}}