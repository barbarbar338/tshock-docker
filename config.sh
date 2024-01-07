CONFIG_FILE="./serverconfig.txt"

WORLDNAME_VAR=${WORLDNAME:-"myworld"}
MOTD_VAR=${MOTD:-"TShock on Docker!"}
DIFFICULTY_VAR=${DIFFICULTY:-"0"}
AUTOCREATE_VAR=${AUTOCREATE:-"1"}

PORT_VAR="7777"
WORLD_PATH_VAR="/worlds"
WORLD_VAR="$WORLD_PATH_VAR/$WORLDNAME_VAR.wld"

sed -i "s|^world=.*$|world=$WORLD_VAR|" $CONFIG_FILE
sed -i "s|^worldpath=.*$|worldpath=$WORLD_PATH_VAR|" $CONFIG_FILE
sed -i "s|^motd=.*$|motd=$MOTD_VAR|" $CONFIG_FILE
sed -i "s|^port=.*$|port=$PORT_VAR|" $CONFIG_FILE
sed -i "s|^worldname=.*$|worldname=$WORLDNAME_VAR|" $CONFIG_FILE
sed -i "s|^diffculty=.*$|diffculty=$DIFFICULTY_VAR|" $CONFIG_FILE
sed -i "s|^autocreate=.*$|autocreate=$AUTOCREATE_VAR|" $CONFIG_FILE

echo "Config file updated:"
cat $CONFIG_FILE
