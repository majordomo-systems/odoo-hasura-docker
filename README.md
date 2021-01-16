# ODOO + HASURA + DOCKER = SCRUMPTIOUS!

Install [docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/) yourself, then run:

``` bash
curl -s https://raw.githubusercontent.com/majordomo-systems/odoo-hasura-docker/14.0/run.sh | sudo bash -s odoo-hasura-docker
```

Start container:
```
$ docker-compose up
```

To run in detached mode, execute this command:

```
$ docker-compose up -d
```

# Custom addons

The **addons** folder contains custom addons. Just put your custom addons if you have any.

# Odoo container management

**Restart Odoo**:

``` bash
$ docker-compose restart
```

**Kill Odoo**:

``` bash
$ docker-compose down
```
