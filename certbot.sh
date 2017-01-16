if [ ! -f "$PWD/certbot-auto" ]
then
wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto
./certbot-auto
fi

read -p "Domains (comma separated): " DOMAINS

MAIN_DOMAIN=${DOMAINS%%,*}

echo "Main domain: $MAIN_DOMAIN"

./certbot/certbot-auto certonly --manual -d $DOMAINS \
    --preferred-challenges=http --manual-auth-hook $PWD/acme-challenge-auth.sh --manual-cleanup-hook $PWD/acme-challenge-cleanup.sh  \
    --agree-tos --email "webmaster@silverbackstudio.it" --manual-public-ip-logging-ok
