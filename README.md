Storj integration/staging tree
==============================

This repository is for development and integration testing of all of the distributed Storj network services.

## Development

To update a module in the container, change the `package.json` before building the image. It's best to use specific git hashes in the form `storj/bridge#bd62050f1585278e6cbf18e620b6501f814359e3` as the version to bust the build cache for testing development branches.

## Build

To build docker image, from within this repository:


```bash
docker build -t storj-integration .
```

Create a persistent container, ports for the bridge and farmers are exposed for testing uploading and downloading:

```bash
docker create -p 8080:8080 -p 9000:9000 -p 9001:9001 -p 9002:9002 -p 9003:9003 -p 9004:9004 -p 9005:9005 -p 9006:9006 -p 9007:9007 -p 9008:9008 -p 9009:9009 -p 9010:9010 -p 9011:9011 -p 9012:9012 -p 9013:9013 -p 9014:9014 -p 9015:9015 -p 9016:9016 -t -i storj-integration bash
```

And to start and attach to the container:

```bash
docker start -a -i <hash_of_container>
```

*Note: If you're running os macos, you may need to increase the CPUs and memory available to docker.*

## Running the Sandbox

To run a *sandbox* test network:

First edit the file at `./config/storj-bridge/config.json` to point to a
email server, so that you can test the mailer and registration.

And then run this script to start everything *(16 farmers, 6 renters and 1 bridge)*:
```bash
./scripts/start_everything.sh
```

You can then use pm2 to look at logs and status for each service by name:
```
pm2 status
pm2 log
pm2 log bridge --lines 100
pm2 log renter-6
pm2 log farmer-4
pm2 stop farmer-4
```

And check that mongo has the data that is expected:
```
mongo
use storj-sandbox
```

Modify files for testing purposes:
```
vim ./node_modules/storj-bridge/lib/constants.js
```

To stop all of the services, and exit the container:
```
./scripts/stop_everything.sh
exit
```

## Testing File Transfers

Using the CLI included with https://github.com/Storj/libstorj you can register and transfer files for development and testing.

```
STORJ_BRIDGE=http://localhost:8080 ./src/storj register
```

And then check your email and activate the account, and then add buckets and files:

```
STORJ_BRIDGE=http://localhost:8080 ./src/storj add-bucket
STORJ_BRIDGE=http://localhost:8080 ./src/storj upload-file <bucket_hash> <filename>
STORJ_BRIDGE=http://localhost:8080 ./src/storj download-file <bucket_hash> <file_hash>
```
