# Install nginx

nginx-ppa-repo:
  pkgrepo.managed:
    - humanname: nginx-ppa-ubuntu
    - ppa: nginx/stable
    - file: /etc/apt/sources.list.d/nginx.list
    - keyid: C300EE8C
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: nginx
    - watch_in:
      - pkg: nginx

nginx:
  pkg.latest:
    - name: nginx
    - refresh: True

# If nginx, apply nginx nginx config.
/etc/nginx/conf.d/proxy.conf:
  file.managed:
    - source: salt://nginx/config/proxy.conf
    - user: root
    - group: root
    - mode: 0644
    - require:
      - nginx

/etc/nginx/conf.d/simple-load-balancing.conf:
  file.managed:
    - source: salt://nginx/config/simple-load-balancing.conf
    - user: root
    - group: root
    - mode: 0644
    - require:
      - nginx

