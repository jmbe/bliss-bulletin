#/bin/bash

user=$1
database=bulletin-dev
database_user=bulletin-dev
database_password=bulletin-dev

if [ -z $user ]; then
    echo "Usage: $(basename $0) <user>" >&2
    exit 2
fi


echo "Dropping and recreating ${database}, with permissions for ${database_user}"

(
cat <<EOF

drop database if exists \`${database}\`;
create database \`${database}\`;
grant all privileges on \`${database}\`.* to '${database_user}'@'localhost' identified by '${database_password}';

EOF
) | mysql -u$user -p

echo "Done."

