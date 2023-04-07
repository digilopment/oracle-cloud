#!/bin/sh

if [ -e ../sqldeveloper/sqldeveloper.sh ]; then
    cd ../sqldeveloper
    ./sqldeveloper.sh
else
    echo "Sql Developer is not installed"
fi



