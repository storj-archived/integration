Storj integration/staging tree
==============================

This repository is for development and integration testing of all of the
distributed Storj network services.

## Build Docker Container

To build docker image:


```bash
git clone https://github.com/storj/integration
cd integration
sudo docker build -t storj-integration .
```

Create a persistant container:

```bash
sudo docker create -p 8080:8080 -t -i storj-integration bash
```

And to start and attach to the container:

```bash
sudo docker start -a -i <hash_of_container>
```

To run a test network, run the script within the container:

```bash
./scripts/start_everything.sh
```

## Development

To update a module in the container, change the `package.json` either in the container or
before building the image.

To development on a module, clone the repository, and then `npm link` it in:
```
git clone <git_url_for_module>
cd <module_name>
npm link
cd <this_project_path>
npm link <module_name>
```

This will create a symlink in `node_modules` to the development branch.
