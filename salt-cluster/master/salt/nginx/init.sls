nginx:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: nginx
