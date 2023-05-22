# Airflow-Example

``Initializing Environment``

Before starting Airflow for the first time, You need to prepare your environment, i.e. create the necessary files, directories and initialize the database.

On Linux, the mounted volumes in container use the native Linux filesystem user/group permissions, so you have to make sure the container and host computer have matching file permissions.

```
mkdir ./dags ./logs ./plugins
echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env
```

On all operating system, you need to run database migrations and create the first user account. To do it, run.

```
docker compose up airflow-init
```

After initialization is complete, you should see a message like below.

`Output:`
```
airflow-init_1       | Upgrades done
airflow-init_1       | Admin user airflow created
airflow-init_1       | 2.0.1
start_airflow-init_1 exited with code 0
The account created has the login airflow and the password airflow.
```
Running Airflow
Now you can start all services:

```
docker compose up
```