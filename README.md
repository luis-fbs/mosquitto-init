# mosquitto-init
Fast initialization for Eclipse Mosquitto message broker.

## How to run
### Set up the project
```bash
./setup.sh
```

### Launch the broker
```bash
docker compose up -d
```

### Create a user and password to access the broker
```bash
docker compose exec mosquitto mosquitto_passwd /mosquitto/config/passwd new_user
```
