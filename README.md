Setup instructions

Generate a [Digital Ocean](https://www.digitalocean.com) account.

### Generate an API key

[API key](https://cloud.digitalocean.com/generate_api_key)

Install [docker](https://docs.docker.com/installation/).

### Download and start a PostgreSQL database

```console
docker run -d -p 5434:5432 --name zinedistro-db -e POSTGRESQL_USER=docker -e POSTGRESQL_PASS=docker orchardup/postgresql
```

### Create the database

```console
rake db:create DB_1_PORT_5432_TCP_ADDR=192.168.59.104 DB_1_PORT_5432_TCP_PORT=5434
```

### Load the schema

```console
bin/rake db:schema:load
```

### Seed the database

```console
bin/rake db:setup
```

