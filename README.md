Storj integration/staging tree
==============================

This repository is for development and integration testing of all of the
distributed Storj network services.

To build docker image:

```bash
git clone https://github.com/storj/integration
cd integration
git submodule init
git submodule update
docker build -t storj-integration .
```

To run bash into the image:

```bash
docker run -i -t storj-integration /bin/bash
```

To add a new repository:

```bash
git submodule add https://github.com/Storj/<repo_name> src/code/<package_name>
```
Then include installation steps in `src/code/install.sh`, this will likely include
adding the module to the modules array, so that it will run `npm install` and
`npm link`, and then make sure to link those dependencies with each other.

To run a test network, first run a shell for the image, and run the script:

```
./start_everything.sh
```

To create a container for the image (this should give a hash as the result):

```
sudo docker create -t -i storj-integration bash
```

To start and attach to the container:

```
sudo docker start -a -i <hash_of_container>
```
