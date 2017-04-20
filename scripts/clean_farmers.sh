#!/bin/bash
for i in `seq 1 16`; do
    rm -rfv /root/config/storj-share/farmer-$i/contracts.db
    rm -rfv /root/config/storj-share/farmer-$i/sharddata.kfs
done
