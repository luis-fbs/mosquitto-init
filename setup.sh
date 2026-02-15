DIRECTORIES=('data' 'log')
for directory in ${DIRECTORIES[@]}; do
    if [[ ! -d $directory ]]; then
        mkdir $directory
    fi
done

MOSQUITTO_UID="1883"
MOSQUITTO_GID="1883"

LOG_FILE="log/mosquitto.log"
if [[ ! -f $LOG_FILE ]]; then
	: > $LOG_FILE
	sudo chown :$MOSQUITTO_GID $LOG_FILE
fi

PASSWD_FILE="config/passwd"
has_auth=0
if [[ -f $PASSWD_FILE ]]; then
    if [[ -s $PASSWD_FILE ]]; then
        has_auth=1
    fi
else
    : > $PASSWD_FILE
    sudo chown $MOSQUITTO_UID:$MOSQUITTO_GID $PASSWD_FILE
    sudo chmod 660 $PASSWD_FILE
fi
