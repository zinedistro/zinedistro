# Zine Distro in a Box

### What is it?

A rails application to facilitate creating a [zine](https://en.wikipedia.org/wiki/Zine) distro. It includes a complete application to get started sharing zines online.

### Is It Good?

Yes.

### Is It "Production Ready™"?

Nope.

## Setup instructions

1. Install [docker](https://docs.docker.com/installation/).

2. Start it.

### Download and start a PostgreSQL database

```console
RUN_COMMAND="bin/rake db:create db:schema:load db:migrate db:seed" bin/start 
```

### Start the application

```console
bin/start 
```
