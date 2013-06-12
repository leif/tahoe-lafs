#!/bin/bash

# quick hack for bringing up a new tahoe grid for testing
# by Leif Ryge
# No Rights Reserved / WTFPL 2013

set -e

if [ $# -lt 1 ]; then
    echo "usage: $0 node_count [target_dir [base_port]]"
    echo
    echo "This creates and starts an introducer, client, and some number of"
    echo "storage nodes in the target_dir directory."
    echo
    echo "The default target_dir is 'testgrid' and the default base_port is 3456."
    echo
    exit
fi

node_count=$1
target_dir=$2
base_port=$3

[ "$base_port" == "" ] && base_port=3456
[ "$target_dir" == "" ] && target_dir=testgrid

client=$target_dir/client
introducer=$target_dir/introducer

for i in $(seq $base_port $(expr $base_port + 1 + $node_count)); do
    if netstat -tapn 2>/dev/null|grep LISTEN|grep $i; then
        echo "The above listener(s) are in the way."
        exit 1
    fi
done

if [ -d "$target_dir" ]; then
    echo target_dir $target_dir exists
    exit
fi

mkdir $target_dir

tahoe create-introducer $introducer
echo $(expr $base_port + 1) > $introducer/introducer.port
tahoe start $introducer

echo -n "Waiting for introducer to start"
while [ ! -f $introducer/private/introducer.furl ]; do
 echo -n .
 sleep .1
done
sleep .2
echo

introducer_furl=$(cat $introducer/private/introducer.furl)

tahoe create-client -n $client -p tcp:$base_port:interface=127.0.0.1 -i "$introducer_furl" $client
tahoe start $client

for n in $(seq 1 $node_count); do
    nodename=$target_dir/node$n
    port=$(expr $base_port + 1 + $n)
    tahoe create-node -n $nodename -p none -i "$introducer_furl" $nodename
    echo $port > $nodename/client.port
    tahoe start $nodename
done
curl -s http://localhost:$base_port/ >/dev/null
tahoe -d $client create-alias tahoe
tahoe -d $client check tahoe:
echo
echo "Ok, the gateway is running. Possible next steps:"
echo " - www-browser http://localhost:$base_port/"
echo " - tahoe -d $client check --raw tahoe:"
echo " - tahoe -d $client webopen tahoe:"
echo " - for node in $target_dir/*; do tahoe stop \$node; done"
echo

