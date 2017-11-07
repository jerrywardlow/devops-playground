mysql_deps:
  pkg.installed:
    - pkgs:
      - debconf-utils: 'latest'
      - python-mysqldb: 'latest'

mysql_setup:
  debconf.set:
    - name: mysql-server
    - data:
        'mysql-server/root_password': {'type': 'password', 'value': 'password'}
        'mysql-server/root_password_again': {'type': 'password', 'value': 'password'}
    - require:
      - pkg: mysql_deps
