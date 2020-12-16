#/bin/ash

if [ -z $MYSQL_HOST ] || [ -z $MYSQL_USER ] || [ -z $MYSQL_DATABASE ] || [ -z $MYSQL_PASSWORD ]; then
    echo "Missing one or more of the following required environment variables"
    echo "  * \$MYSQL_HOST"
    echo "  * \$MYSQL_USER"
    echo "  * \$MYSQL_DATABASE"
    echo "  * \$MYSQL_PASSWORD"
    exit
fi

mysql -p$MYSQL_PASSWORD -u $MYSQL_USER -h $MYSQL_HOST $MYSQL_DATABASE < /mysql-schema.sql

/usr/sbin/pdns_server --daemon=no --guardian=no --loglevel=9 --gmysql-password=$MYSQL_PASSWORD --gmysql-user=$MYSQL_USER --gmysql-dbname=$MYSQL_DATABASE --gmysql-host=$MYSQL_HOST --api-key=API_KEY
