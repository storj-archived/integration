root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."

#rabbitmq
service rabbitmq-server start

#mongodb
service mongod start

#storjbridge
pm2 start -n bridge $root_dir/bin/storj-bridge -- -c $root_dir/config/storj-bridge/config.json -d $root_dir/config/storj-bridge
pm2 start -n monitor $root_dir/bin/storj-monitor -- -c $root_dir/config/storj-bridge/monitor.json

#storjrenters
pm2 start -n landlord $root_dir/bin/storj-complex -- -c $root_dir/config/storj-complex/landlord.json
pm2 start -n renter-1 $root_dir/bin/storj-complex -- -c $root_dir/config/storj-complex/renter-1.json
pm2 start -n renter-2 $root_dir/bin/storj-complex -- -c $root_dir/config/storj-complex/renter-2.json
pm2 start -n renter-3 $root_dir/bin/storj-complex -- -c $root_dir/config/storj-complex/renter-3.json
pm2 start -n renter-4 $root_dir/bin/storj-complex -- -c $root_dir/config/storj-complex/renter-4.json
pm2 start -n renter-5 $root_dir/bin/storj-complex -- -c $root_dir/config/storj-complex/renter-5.json
pm2 start -n renter-6 $root_dir/bin/storj-complex -- -c $root_dir/config/storj-complex/renter-6.json

#storjfarmers
pm2 start -n farmer-1 $root_dir/bin/storjshare -- start --datadir $root_dir/config/storj-share/farmer-1 -p password
pm2 start -n farmer-2 $root_dir/bin/storjshare -- start --datadir $root_dir/config/storj-share/farmer-2 -p password
pm2 start -n farmer-3 $root_dir/bin/storjshare -- start --datadir $root_dir/config/storj-share/farmer-3 -p password
pm2 start -n farmer-4 $root_dir/bin/storjshare -- start --datadir $root_dir/config/storj-share/farmer-4 -p password

