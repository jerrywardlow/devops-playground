nginx:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/nginx.conf
    - user: root
    - group: root
    - mode: 644

/etc/nginx/sites-available/default-site:
  file.managed:
    - source: salt://nginx/files/default-site
    - user: root
    - group: root
    - mode: 644

/etc/nginx/sites-enabled/default-site:
  file.symlink:
    - target: /etc/nginx/sites-available/default-site
    - require:
      - file: /etc/nginx/sites-available/default-site

/var/www/html/index.html:
  file.managed:
    - source: salt://nginx/files/index.html
    - user: root
    - group: root
    - mode: 644
