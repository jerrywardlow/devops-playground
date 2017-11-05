haproxy:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - pkg: haproxy
