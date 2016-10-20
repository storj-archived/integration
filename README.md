Storj Integration/Staging Tree
==============================

This repository is for the purposes of running a suite of integration tests with all network components of the Storj network.

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
git submodule add https://github.com/Storj/<repo_name> src/<package_name>
```
**Note**: All items in `src` are copied into the `/home/storj/` directory in the docker image.

Then include installation steps into `src/install.sh`, this will likely include addinng the module to the modules array, so that it will run `npm install` and `npm link`, and then make sure to link those dependencies with each other.

