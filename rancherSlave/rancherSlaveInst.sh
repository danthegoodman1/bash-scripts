#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

$etcd = ""
$controlplane = ""
$worker = ""

while getopts ":ecwm" opt; do
  case ${opt} in
    e ) #enable etcd
      $etcd = "--etcd"
      ;;
    t ) # process option t
      ;;
    \? ) echo "Usage: cmd [-h] [-t]"
      ;;
  esac
done



ufw allow 22
ufw allow 80
ufw allow 443
ufw allow 10250
ufw allow 10256
ufw allow 30000:32767/tcp

sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run rancher/agent:v2.0.0-beta3 --server $1 --token 66t8pbf229znjlzcmh69ncp8cl6vv4blllb6kmwth9ql2jc2vdlnvz --ca-checksum d8b3bb9c8912c9684c150510b5334ed7ca391832a2bdb989ad0246de577e7452 --etcd --controlplane --worker
