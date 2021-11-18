# sleep "$(shuf -i 1-10 -n 1)"
echo " ---> using ENV_CONTROLLER_API_URL = ${ENV_CONTROLLER_API_URL}"
echo " ---> using ENV_CONTROLLER_USERNAME = ${ENV_CONTROLLER_USERNAME}"
echo " ---> using ENV_CONTROLLER_PASSWORD = ${ENV_CONTROLLER_PASSWORD}"
# Authenticate to controller with credentials in order to get the Session Token
curl --connect-timeout 30 --retry 10 --retry-delay 5 -sk -c cookie.txt -X POST --url 'https://'${ENV_CONTROLLER_API_URL}'/api/v1/platform/login' --header 'Content-Type: application/json' --data '{"credentials": {"type": "BASIC","username": "'"${ENV_CONTROLLER_USERNAME}"'","password": "'"${ENV_CONTROLLER_PASSWORD}"'"}}'

# Remove the instance from infrastructure
# sleep "$(shuf -i 1-10 -n 1)"
echo " ---> using ENV_CONTROLLER_API_URL = ${ENV_CONTROLLER_API_URL}"
echo " ---> using ENV_CONTROLLER_LOCATION = ${ENV_CONTROLLER_LOCATION}"
echo " ---> using ENV_CONTROLLER_INSTANCE_NAME = ${ENV_CONTROLLER_INSTANCE_NAME}"
curl --connect-timeout 30 --retry 10 --retry-delay 5  -sk -b cookie.txt -c cookie.txt  --header 'Content-Type: application/json' -X DELETE --url 'https://'${ENV_CONTROLLER_API_URL}'/api/v1/infrastructure/locations/'${ENV_CONTROLLER_LOCATION}'/instances/'${ENV_CONTROLLER_INSTANCE_NAME}
