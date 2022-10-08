#!/bin/sh

##########################################################################################################################################################
# Déclaration de la variable de test #
######################################
IMAGE=vaultwarden/server
CONTENEUR=BitWarden
HTTP=7777:80

MYSQL_HOST=$(ip add | grep 192.168.1 | cut -d "/" -f 1 | cut -c 10-30)
MYSQL_PORT=3306
MYSQL_DATABASE=database
MYSQL_USER=username
MYSQL_PASS=password

DOMAIN=https://localhost
ADMIN_TOKEN='Passw0rd123'
ENABLE_SMTP=true
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_FROM=XXXXXXXXX@gmail.com
SMTP_FROM_NAME=[VaultWarden] Mail de confirmation
SMTP_USERNAME=XXXXXXXXX@gmail.com
SMTP_PASSWORD=SMTP_PASSWORD

##########################################################################################################################################################
# Fermeture du Conteneur #
##########################
docker container rm -f  $CONTENEUR

##########################################################################################################################################################
# Lancement du Conteneur #
##########################
docker run -d \
--name=$CONTENEUR \
--restart unless-stopped \
--net=host \
--hostname $CONTENEUR \
--volume /volume1/Docker/$CONTENEUR:/data \
--env DOMAIN="$DOMAIN" \
--env SENDS_ALLOWED="true" \
--env USER_ATTACHMENT_LIMIT="512" \
--env ORG_ATTACHMENT_LIMIT="512" \
--env TRASH_AUTO_DELETE_DAYS="365" \
--env INCOMPLET_2FA_TIME_LIMIT="5" \
--env DISABLE_ICON_DOWNLOAD="false" \
--env SIGNUPS_ALLOWED="false" \
--env SIGNUPS_VERIFY="true" \
--env SIGNUPS_VERIFY_RESEND_TIME="3600" \
--env SIGNUPS_VERIFY_RESEND_LIMIT="6" \
--env SIGNUPS_DOMAINS_WHITELIST="" \
--env ORG_CREATION_USERS="" \
--env INVITATIONS_ALLOWED="true" \
--env EMERGENCY_ACCESS_ALLOWED="true" \
--env PASSWORD_ITERATIONS="100000" \
--env SHOW_PASSWORD_HINT="false" \
--env ADMIN_TOKEN="$ADMIN_TOKEN" \
--env INVITATION_ORG_NAME="Vaultwarden" \
--env ICON_BLACKLIST_NON_GLOBAL_IPS="true" \
--env DISABLE_2FA_REMEMBER="false" \
--env AUTHENTICATOR_DISABLE_TIME_DRIFT="false" \
--env REQUIRE_DEVICE_EMAIL="false" \
--env RELOAD_TEMPLATES="false" \
--env LOG_TIMESTAMP_FORMAT="%d-%m-%Y %H:%M:%S.%3f" \
--env DISABLE_ADMIN_TOKEN="false" \
--env _ENABLE_SMTP="$ENABLE_SMTP" \
--env SMTP_HOST="$SMTP_HOST" \
--env SMTP_SSL="true" \
--env SMTP_EXPLICIT_TLS="false" \
--env SMTP_PORT="$SMTP_PORT" \
--env SMTP_FROM="$SMTP_FROM" \
--env SMTP_FROM_NAME="$SMTP_FROM_NAME" \
--env SMTP_USERNAME="$SMTP_USER" \
--env SMTP_PASSWORD="$SMTP_PASS" \
--env SMTP_AUTH_MECHANISM="Plain" \
--env SMTP_TIMEOUT="15" \
--env HELO_NAME="VaultWarden" \
--env SMTP_ACCEPT_INVALID_CERTS="false" \
--env SMTP_ACCEPT_INVALID_HOSTNAMES="false" \
--env DATA_FOLDER="data" \
--env DATABASE_URL="mysql://$MYSQL_USER:$MYSQL_PASS@$MYSQL_HOST:MYSQL_PORT/$MYSQL_DATABASE" \
--env ICON_CACHE_FOLDER="data/icon_cache" \
--env ATTACHMENTS_FOLDER="data/attachments" \
--env SENDS_FOLDER="data/sends" \
--env TEMPLATES_FOLDER="data/templates" \
--env RSA_KEY_FILENAME="data/rsa_key" \
--env WEB_VAULT_FOLDER="web-vault/" \
--env WEBSOCKET_ENABLED="false" \
--env WEBSOCKET_ADDRESS="0.0.0.0" \
--env WEBSOCKET_PORT="3012" \
--env JOB_POLL_INTERVAL_MS="30000" \
--env SEND_PURGE_SCHEDULE="0 5 * * * *" \
--env TRASH_PURGE_SCHEDULE="0 5 0 * * *" \
--env INCOMPLETE_2FA_SCHEDULE="30 * * * * *" \
--env EMERGENCY_NOTIFICATION_REMINDER_SCHEDULE="0 5 * * * *" \
--env EMERGENCY_REQUEST_TIMEOUT_SCHEDULE="0 5 * * * *" \
--env DOMAIN_SET="false" \
--env DOMAIN_ORIGIN="http://localhost" \
--env DOMAIN_PATH="" \
--env WEB_VAULT_ENABLED="true" \
--env _IP_HEADER_ENABLED="true" \
--env ICON_SERVICE="internal" \
--env EXTENDED_LOGGING="true" \
--env USE_SYSLOG="false" \
--env LOG_FILE="" \
--env LOG_LEVEL="info" \
--env ENABLE_DB_WAL="true" \
--env DB_CONNECTION_RETRIES="15" \
--env DATABASE_MAX_CONNS="10" \
--env LOGIN_RATELIMIT_SECONDS="60" \
--env LOGIN_RATELIMIT_MAX_BURST="10" \
--env ADMIN_RATELIMIT_SECONDS: '300' \
--env ADMIN_RATELIMIT_MAX_BURST: '3' \
--env _DUO_AKEY: '' \
--env SMTP_DEBUG: 'FALSE' \
--label cacher="oui" \
$IMAGE:latest



##########################################################################################################################################################
# Démarrage du Conteneur #
##########################
docker start $CONTENEUR

##########################################################################################################################################################
# Code Retour en Fermeture #
############################
exit 0