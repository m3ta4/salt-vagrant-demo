# Remove filebeat

filebeat:
  pkg.purged:
    - version: 1.3.0

elasticsearch:
  host.absent:
    - ip: 10.1.6.40

graylog:
  host.absent:
    - ip: 10.1.6.57

