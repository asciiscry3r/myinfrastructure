## Cloud and local components for work/lab/etc
====================

    * backups
    * rpi server
    * networmonitoring - grafana - EC2, prometheus - EC2
    * github and blog
    * photo sharing
    * IasC, SEC?, CM, OPS

### Backups
=====================

    * encrypted
    * ansible CM
    * local and remote?
    * nanopi + HHD
    * S3 + Glacier
    * prometheus exporter

### Rpi 3 b+
=====================

    * nixos or arch
    * encrypted
    * ansible CM
    * prometheus exporter

### TP Link Archer C7
========================

    * openwrt
    * prometheus exporter, snmp6
    * ETC
    * bash CM

### AWS
=========================

    * terraform
    * packer
    * encrypted
    * ansible
    * blog
    * service vpn fot monitoring
    * grafana
    * prometheus exporter

___________

All drives must be encrypted as possible.
Prometheus server must be placed on Raspberry PI.
Site: https://themes.getnikola.com/v8/hack/demo/pages/handbook/#all-you-need-to-know

_____________
[He is LIVE!!!!](https://photos.app.goo.gl/L8TDwDuh3dGLK6V56)

dd from device for diff with original firmware
``
prometheus                                prometheus-json-exporter-bin              prometheus-redis-exporter
prometheus-adguard-exporter               prometheus-junos-exporter                 prometheus-redis-exporter-bin
prometheus-apcupsd-exporter               prometheus-libvirt-exporter               prometheus-remo-e-exporter
prometheus-apcupsd-exporter-bin           prometheus-memcached-exporter             prometheus-remo-exporter
prometheus-bin                            prometheus-mumble-exporter                prometheus-slurm-exporter
prometheus-bind-exporter                  prometheus-mysqld-exporter                prometheus-smartctl-exporter
prometheus-bird-exporter                  prometheus-mysqld-exporter-bin            prometheus-snmp-exporter
prometheus-blackbox-exporter              prometheus-nextcloud-exporter             prometheus-speedtest-exporter
prometheus-blackbox-exporter-bin          prometheus-nginxlog-exporter              prometheus-sphinx-exporter
prometheus-bsbmp-exporter-git             prometheus-nginxlog-exporter-bin          prometheus-ssl-exporter
prometheus-client-c                       prometheus-node-exporter                  prometheus-statsd-exporter
prometheus-cpp-git                        prometheus-node-exporter-bin              prometheus-systemd-exporter
prometheus-dnsmasq-exporter-git           prometheus-nut-exporter                   prometheus-transmission-exporter
prometheus-dovecot-exporter-git           prometheus-nvidia-gpu-exporter            prometheus-unbound-exporter
prometheus-exporter-exporter-bin          prometheus-pgbouncer-exporter             prometheus-unbound-exporter-git
prometheus-exporter-proxy                 prometheus-php-fpm-exporter               prometheus-wireguard-exporter
prometheus-filestat-exporter              prometheus-pihole-exporter                prometheus-xmpp-blackbox-exporter
prometheus-fritzbox-exporter-git          prometheus-postfix-exporter               prometheus-xmpp-webhook
prometheus-fritzbox-exporter-sberk42-git  prometheus-postgresql-exporter            prometheus-xmpp-webhook-bin
prometheus-git                            prometheus-process-exporter               prometheus-xmpp-webhook-git
prometheus-haproxy-exporter-bin           prometheus-process-exporter-bin           prometheus-zfs-exporter
prometheus-ipmi-exporter                  prometheus-push-gateway-bin               prometheus-zfsprom-exporter
prometheus-json-exporter                  prometheus-pve-exporter                   
