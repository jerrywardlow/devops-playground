base:
  '*':
    - base
  'web*':
    - nginx
  'lb':
    - haproxy
  'db':
    - mysql
