# Docker Environment

Example setup showing how to manage easily a docker application composed of
various moving parts.

In order to get a full application running, these steps are required

1. Clone all repos required for the app (e.g. a front-end and a back-end).
2. Create docker resources that are shared by all repos (like the network).
3. Install specific projects, run their install scripts and package managers.
5. Start up all apps

## Installation

Make `http://frontend` and `http://backend` point to localhost by running

```
echo '127.0.0.1 backend frontend' >> /etc/hosts
```

Clone this repo, get into the cloned directory and install everything at once

```
git clone https://github.com/phillaf/docker-environment.git cd
docker-environment make init
```

You can now access your backend and frontend by visiting the urls
`http://backend` and `http://frontend`.

## Usage

- `make update` pull all docker images, rebuild them and run update scripts on all repos
- `make up`, `make down` startup or shutdown all projects at once
