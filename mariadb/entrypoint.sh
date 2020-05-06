#!/bin/sh

if [ "${1:0:1}" = '-' ]; then
	set -- mysqld_safe --user=mysql "$@"
fi

mysql_install_db --user=mysql

mysqld --user=mysql --skip-networking --socket=/var/lib/mysql/mysql.sock &

pid="$!"

mysql=( mysql --protocol=socket -uroot -hlocalhost --socket=/var/lib/mysql/mysql.sock )
for i in {30..0}; do
        if echo 'SELECT 1' | "${mysql[@]}" &> /dev/null; then
                break
        fi
        echo 'MySQL init process in progress...'
        sleep 1
done
if [ "$i" = 0 ]; then
        echo >&2 'MySQL init process failed.'
        exit 1
fi

# 执行/docker-entrypoint-initdb.d目录下所有*.sql文件
variableSQLFiles=$(find /docker-entrypoint-initdb.d -name "*.sql")
for variableSQLFile in $variableSQLFiles; do
  ${mysql[@]} < $variableSQLFile
done

echo "grant all privileges on *.* to root@'%' identified by '123456'" | ${mysql[@]}
echo "flush privileges" | ${mysql[@]}

if ! kill -s TERM "$pid" || ! wait "$pid"; then
	echo >&2 'MySQL init process failed.'
	exit 1
fi

echo
echo 'DB init process done. Ready for start up.'
echo

exec "$@"
