DIRECTORIES=('data' 'log')
for directory in ${DIRECTORIES[@]}; do
    if [[ ! -d $directory ]]; then
        mkdir $directory
    fi
done

LOG_FILE="log/mosquitto.log"
if [[ ! -f $LOG_FILE ]]; then
	: > $LOG_FILE
fi

PASSWD_FILE="config/passwd"
has_auth=0
if [[ -f $PASSWD_FILE ]]; then
    if [[ -s $PASSWD_FILE ]]; then
        has_auth=1
    fi
else
    : > $PASSWD_FILE
fi
