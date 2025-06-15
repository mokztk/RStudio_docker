#!/bin/bash

# sshd を起動時に実行する

mkdir /var/run/sshd
mkdir /etc/services.d/sshd

cat << EOF > /etc/services.d/sshd/run
#!/usr/bin/execlineb -P
/usr/sbin/sshd -D -e
EOF

chmod 755 /etc/services.d/sshd/run
