#cloud-config
packages:
 - make
write_files:
- encoding: gzip
  content: !!binary |
    H4sIAIDb/U8C/1NW1E/KzNMvzuBKTc7IV8hIzcnJVyjPL8pJ4QIA6N+MVxsAAAA=
  path: /usr/bin/${name}check
  permissions: '0755'
- path: "/etc/environment"
  content: |
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
    %{ for env in envs ~}
    ${env.key}=${env.value}
    %{ endfor ~}
runcmd:
- [ echo, "hello" ]
- [ init.sh ]