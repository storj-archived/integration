root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."

#redis
service redis-server start

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
pm2 start -n farmer-1 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-1/config.json
pm2 start -n farmer-2 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-2/config.json
pm2 start -n farmer-3 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-3/config.json
pm2 start -n farmer-4 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-4/config.json
pm2 start -n farmer-5 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-5/config.json
pm6 start -n farmer-6 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-6/config.json
pm2 start -n farmer-7 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-7/config.json
pm2 start -n farmer-8 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-8/config.json
pm2 start -n farmer-9 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-9/config.json
pm2 start -n farmer-10 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-10/config.json
pm2 start -n farmer-11 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-11/config.json
pm2 start -n farmer-12 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-12/config.json
pm2 start -n farmer-13 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-13/config.json
pm2 start -n farmer-14 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-14/config.json
pm2 start -n farmer-15 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-15/config.json
pm2 start -n farmer-16 $root_dir/bin/storjshare-start -- -d -c $root_dir/config/storj-share/farmer-16/config.json
