Storj integration/staging tree
==============================

This repository is for development and integration testing of all of the
distributed Storj network services.

## Development

To update a module in the container, change the `package.json` before building the image.

## Build

To build docker image, from within this repository:


```bash
docker build -t storj-integration .
```

Create a persistant container:

```bash
docker create -p 8080:8080 -p 9000:9000 -p 9001:9001 -p 9002:9002 -p 9003:9003 -p 9004:9004 -p 9005:9005 -p 9006:9006 -p 9007:9007 -p 9008:9008 -p 9009:9009 -p 9010:9010 -p 9011:9011 -p 9012:9012 -p 9013:9013 -p 9014:9014 -p 9015:9015 -p 9016:9016 -t -i storj-integration bash
```

And to start and attach to the container:

```bash
docker start -a -i <hash_of_container>
```

## Testing

To run a *sandbox* test network:

First edit the file at `./config/storj-bridge/config.json` to point to a
email server, so that you can test the mailer and registration.

And then run this script to start everything *(4 farmers, 6 renters and 1 bridge)*:
```bash
./scripts/start_everything.sh
```

To perform any activity that needs testing using a bridge client you'll likely
first need to register:
```
./bin/storj register
```

And then check your email and activate the account, and you can then run:
```
./bin/storj login
```

And then verify that services are working together as expected. For example to test
upload and download:
```
./bin/storj add-bucket
./bin/storj upload-file <bucket_hash> <filename>
./bin/storj download-file <bucket_hash> <file_hash>
```

You can then use pm2 to look at logs and status for each service by name:
```
pm2 status
pm2 log
pm2 log bridge
pm2 log bridge --lines 100
pm2 log renter-1
pm2 log renter-6
pm2 log farmer-1
pm2 log farmer-4
```

And check that mongo has the data that is expected:
```
mongod
use storj-sandbox
```

To stop all of the services, and exit the container:
```
./scripts/stop_everything.sh
exit
```
