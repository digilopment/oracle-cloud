if [ -z "$1" ]; then
  echo "Please set password as argument"
else
  echo "New database password is: $1"
  sudo docker exec oracle-cloud ./setPassword.sh $1
fi

