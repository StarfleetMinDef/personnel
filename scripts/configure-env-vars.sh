DB_HOSTNAME=${1-localhost}
DB_USERNAME=${2-root}
REPOSITORIES=${3-/}
ENCRYPTION_KEY=$(sudo cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)
VANILLA_COOKIE_SALT=$(sudo cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)

echo 'Configuring personnel-api environment variables'
cp ${REPOSITORIES}personnel-api/.env.sample ${REPOSITORIES}personnel-api/.env
sed -i ${REPOSITORIES}personnel-api/.env \
    -e "s,DB_DEFAULT_HOSTNAME=.*,DB_DEFAULT_HOSTNAME=${DB_HOSTNAME}," \
    -e "s,DB_DEFAULT_USERNAME=.*,DB_DEFAULT_USERNAME=${DB_USERNAME}," \
    -e "s,DB_FORUMS_HOSTNAME=.*,DB_FORUMS_HOSTNAME=${DB_HOSTNAME}," \
    -e "s,DB_FORUMS_USERNAME=.*,DB_FORUMS_USERNAME=${DB_USERNAME}," \
    -e "s,ENCRYPTION_KEY=.*,ENCRYPTION_KEY=${ENCRYPTION_KEY}," \
    -e "s,VANILLA_COOKIE_SALT=.*,VANILLA_COOKIE_SALT=${VANILLA_COOKIE_SALT},"

echo 'Configuring personnel-app environment variables'
cp ${REPOSITORIES}personnel-app/.env.sample ${REPOSITORIES}personnel-app/.env
sed -i ${REPOSITORIES}personnel-app/.env \
    -e "s,API_HOST=.*,API_HOST=/${REPOSITORIES}personnel-api," \
    -e "s,COAT_DIR=.*,COAT_DIR=/${REPOSITORIES}personnel-api/coats," \
    -e "s,FORUM_VANILLA_BASE_URL=.*,FORUM_VANILLA_BASE_URL=/${REPOSITORIES}forums," \

echo 'Configuring forums environment variables'
cp ${REPOSITORIES}forums/conf/config.sample.php ${REPOSITORIES}forums/conf/config.php
chmod 777 ${REPOSITORIES}forums/conf/config.php
sed -i ${REPOSITORIES}forums/conf/config.php \
    -e "s,\$Configuration\['Database'\]\['Host'\] = '.*',\$Configuration\['Database'\]\['Host'\] = '${DB_HOSTNAME}'," \
    -e "s,\$Configuration\['Database'\]\['User'\] = '.*',\$Configuration\['Database'\]\['User'\] = '${DB_USERNAME}'," \
    -e "s,\$Configuration\['Debug'\] = FALSE,\$Configuration\['Debug'\] = TRUE," \
    -e "s,\$Configuration\['Garden'\]\['Cookie'\]\['Salt'\] = '.*',\$Configuration\['Garden'\]\['Cookie'\]\['Salt'\] = '${VANILLA_COOKIE_SALT}'," \
    -e "s,\$Configuration\['Plugins'\]\['AddMenuitem'\]\['Link4'\] = '.*',\$Configuration\['Plugins'\]\['AddMenuitem'\]\['Link4'\] = '${REPOSITORIES}personnel-app/dist',"