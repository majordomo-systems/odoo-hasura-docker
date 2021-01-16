#!/bin/bash
DESTINATION=$1
ARRAY=$(hostname -I)
IP=$(sed 's/\s.*$//' <<<"$ARRAY")

# clone Odoo directory
git clone -b 14.0 https://github.com/majordomo-systems/odoo-hasura-docker.git $DESTINATION
rm -rf $DESTINATION/.git
sudo chmod -R 777 $DESTINATION

# run Odoo
docker-compose -f $DESTINATION/docker-compose.yml up -d

# HOW TO INSTALL MODULES:
# docker exec --user root odoo-hasura-docker_odoo_1 pip3 install #MODULE#
# OR docker exec --user root odoo-hasura-docker_odoo_1 pip3 install -r /mnt/extra-addons/rest-framework/requirements.txt
docker exec --user root odoo-hasura-docker_odoo_1 pip3 install wheel

# module permissions and ownership
docker exec --user root odoo-hasura-docker_odoo_1 chown -R odoo:odoo /mnt/extra-addons
docker exec --user root odoo-hasura-docker_odoo_1 chmod -R 777 /mnt/extra-addons

clear
echo "Odoo @ http://localhost:14069 or http://$IP:14069"
echo "GraphQL Console @ http://localhost:80 or http://$IP:80"