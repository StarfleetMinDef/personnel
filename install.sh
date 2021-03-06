DIR_SCRIPTS=scripts/
DIR_REPOS=repositories/
DB_HOSTNAME=${IP-localhost}
DB_USERNAME=${C9_USER-root}
SITE_HOSTNAME=${C9_HOSTNAME-localhost}
GITHUB_USER=${1-29th}

# Configure Cloud9
sudo npm install -g npm
mysql-ctl start # Starts mysql
apachectl start # Starts apache

# Create databases
. ${DIR_SCRIPTS}create-databases.sh $DB_HOSTNAME $DB_USERNAME

# Install personnel-api
. ${DIR_SCRIPTS}install-personnel-api.sh $DIR_REPOS $GITHUB_USER

# Install personnel-app
. ${DIR_SCRIPTS}install-personnel-app.sh $DIR_REPOS $GITHUB_USER

# Install vanilla
. ${DIR_SCRIPTS}install-vanilla.sh $DIR_REPOS $GITHUB_USER

# Configure environment variables
. ${DIR_SCRIPTS}configure-env-vars.sh $DB_HOSTNAME $DB_USERNAME $DIR_REPOS

# Build personnel-app
. ${DIR_SCRIPTS}build-personnel-app.sh $DIR_REPOS

echo "Installation complete! Browse to http://${SITE_HOSTNAME}/${DIR_REPOS}forums"