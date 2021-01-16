#!/bin/bash
DESTINATION=$1
# clone Odoo directory
git clone --depth=1 https://github.com/majordomo-systems/odoo-hasura-docker.git $DESTINATION
rm -rf $DESTINATION/.git
sudo chmod -R 777 $DESTINATION
# run Odoo
docker-compose -f $DESTINATION/docker-compose.yml up -d
docker exec --user root odoo-hasura-docker_odoo_1 pip3 install wheel
# HOW TO INSTALL MODULES:
# docker exec --user root odoo-hasura-docker_odoo_1 pip3 install #MODULE#
# OR docker exec --user root odoo-hasura-docker_odoo_1 pip3 install -r /mnt/extra-addons/rest-framework/requirements.txt
# set addon permissions and ownership
docker exec --user root odoo-hasura-docker_odoo_1 chown -R odoo:odoo /mnt/extra-addons
docker exec --user root odoo-hasura-docker_odoo_1 chmod -R 777 /mnt/extra-addons
# restart container
# docker stop $(docker ps -aq)
# docker-compose up -d

echo "Odoo @ http://localhost:8069"
echo "GraphQL Console @ http://localhost:80"