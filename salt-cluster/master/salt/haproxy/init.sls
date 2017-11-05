haproxy:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - pkg: haproxy
      - file: /etc/haproxy/haproxy.cfg

/etc/haproxy/haproxy.cfg:
  file.managed:
    - source: salt://haproxy/files/haproxy.cfg.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 644
