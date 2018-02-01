#!/bin/bash

echo "Starting InSpec test suite"

HOST=$(vagrant ssh-config | awk '/HostName/ { print $2 }')
PORT=$(vagrant ssh-config | awk '/Port/ { print $2 }')
IDENTITY_FILE=$(vagrant ssh-config | awk '/IdentityFile/ { print $2 }')

TEST_LIST="cabify haproxy consul"

for t in $TEST_LIST ; do
    inspec exec test/$t/*.rb -t ssh://vagrant@$HOST -p $PORT -i $IDENTITY_FILE
done
