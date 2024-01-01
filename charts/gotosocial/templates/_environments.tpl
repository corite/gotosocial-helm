{{- define "gotosocial.env" -}}
env:
- name: TZ
  value: {{ .Values.timezone | quote }}
- name: GTS_HOST
  value: {{ .Values.host | quote }}
- name: GTS_DB_TYPE
  value: {{ .Values.db.type | quote }}
- name: GTS_DB_ADDRESS
  value: {{ .Values.db.address | quote }}
- name: GTS_LOG_LEVEL
  value: {{ .Values.log.level | quote }}
- name: GTS_LOG_DB_QUERIES
  value: {{ .Values.log.dbQueries | quote }}
- name: GTS_LOG_CLIENT_IP
  value: {{ .Values.log.clientIP | quote }}
- name: GTS_LOG_TIMESTAMP_FORMAT
  value: {{ .Values.log.timestampFormat | quote }}
- name: GTS_APPLICATION_NAME
  value: {{ .Values.applicationName | quote }}
- name: GTS_LANDING_PAGE_USER
  value: {{ .Values.landingPageUser | quote }}
- name: GTS_ACCOUNT_DOMAIN
  value: {{ .Values.accountDomain | quote }}
# setting these statically since they don't really make sense in a k8s/docker context
- name: GTS_BIND_ADDRESS
  value: "0.0.0.0"
- name: GTS_PORT
  value: "8080"
- name: GTS_PROTOCOL
  value: "https"
# ingress stuff
{{- if .Values.ingress.enabled }}
# we don't know where the ingress will "live" so we have to trust everyone
# but since k8s makes sure that requests only enter the cluster through the ingress
# this shouldn't be a problem
- name: GTS_TRUSTED_PROXIES
  value: 0.0.0.0/0
- name: GTS_LETSENCRYPT_ENABLED
  value: "false"
{{- else if .Values.tls.enabled -}}
- name: GTS_LETSENCRYPT_ENABLED
  value: {{ .Values.tls.enabled | quote }}
- name: GTS_LETSENCRYPT_EMAIL_ADDRESS
  value: {{ .Values.tls.email | quote }}
{{- end }}
{{- range $key, $value := .Values.env }}
- name: {{ $key | quote }}
  value: {{ $value | quote }}
{{- end -}}
{{- end -}}