# Install filebeat

filebeat:
  pkgrepo.managed:
    - humanname: Elasticsearch PPA
    - name: deb https://packages.elastic.co/beats/apt stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/beats.list
    - keyid: D88E42B4
    - keyserver: pgp.mit.edu
    - require_in:
      - pkg: filebeat

  pkg.latest:
    - name: filebeat
    - refresh: True

# If this is a loadbalancer apply the lb.filebeat.yml config.

/etc/filebeat/filebeat.yml:
  file.managed:
    - source: salt://filebeat/config/lb.filebeat.yml
    - user: root
    - group: root
    - mode: 0644

