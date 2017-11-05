haproxy:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: haproxy
