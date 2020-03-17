if [ "$1" == "--list" ] ; then
cat ./dynamic-inventory.json

elif [ "$1" == "--host" ]; then
  echo "{ }"
else
  echo "{ }"
fi
