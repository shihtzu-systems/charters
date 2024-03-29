#!/usr/bin/env bash

echo "download archive ${name}"
mkdir -p /opt/${group}/${name}
curl -L ${archiveUrl} -o /opt/${group}/${name}/${name}.zip
unzip /opt/${group}/${name}/${name}.zip -d /opt/${group}/${name}

echo "create update script"
cat > /opt/${group}/${name}/update.sh << EOF
#!/usr/bin/env bash
curl -L ${archiveUrl} -o /opt/${group}/${name}/${name}.zip
unzip /opt/${group}/${name}/${name}.zip -d /opt/${group}/${name}
EOF
chmod +x /opt/${group}/${name}/update.sh

echo "creating setting up ${name} config"
cat > /opt/${group}/${name}/.${name}.yaml << EOF
${config}
EOF

echo "creating systemd service"
cat > /tmp/${name}.service << EOF
[Unit]
Description=${name} service
ConditionPathExists=/opt/${group}/${name}/bin/${os}_${arch}/${name}
After=network.target

[Service]
Type=simple
User=${name}
Group=${name}
LimitNOFILE=1024

Restart=on-failure
RestartSec=10

WorkingDirectory=/opt/${group}/${name}
ExecStart=/opt/${group}/${name}/bin/${os}_${arch}/${name} ${cmd} --config=/opt/${group}/${name}/.${name}.yaml

# make sure log directory exists and owned by syslog
PermissionsStartOnly=true
ExecStartPre=/bin/mkdir -p /var/log/${name}
ExecStartPre=/bin/chown syslog:adm /var/log/${name}
ExecStartPre=/bin/chmod 755 /var/log/${name}
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=${name}

[Install]
WantedBy=multi-user.target
EOF

sudo mv /tmp/${name}.service /lib/systemd/system/.
sudo chmod 755 /lib/systemd/system/${name}.service

echo "adding user"
sudo useradd ${name} -s /sbin/nologin -M | true

echo "enable service"
sudo systemctl enable ${name}.service

echo "start service"
sudo systemctl start ${name}

if [[ "$1" == "-f" ]]; then
  echo "logs"
  sudo journalctl -f -u ${name}
fi
