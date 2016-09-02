# Install filebeat

filebeat-repo:
  pkgrepo.managed:
    - humanname: Elasticsearch PPA
    - name: deb https://packages.elastic.co/beats/apt stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/beats.list
    - keyid: D88E42B4
    - keyserver: pgp.mit.edu
    - require_in:
      - pkg: filebeat

filebeat-pkg:
  pkg.latest:
    - name: filebeat
    - refresh: True

# If nginx, apply nginx filebeat config.
# if pkg:info_instlaled: nginx
# then copy the nginx.filbebeat.yml config

/etc/filebeat/filebeat.yml:
  file.managed:
    - source: salt://filebeat/config/nginx.filebeat.yml
    - user: root
    - group: root
    - mode: 0644
    - replace: True

# Add host entries for elasticsearch and graylog
# to /etc/hosts:

elasticsearch:
  host.present:
    - ip: 10.1.6.40

graylog:
  host.present:
    - ip: 10.1.6.57

# Start the filebeat service
filebeat:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: filebeat

