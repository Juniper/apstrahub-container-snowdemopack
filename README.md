# Snow Tickets
Apstra Anomalies provide an easy way to observe problems in the network fabric.
Service Now is a popular platform to report problems. This automation tracks the fabric and opens tickets in Service Now if there are problems.


## Requirements

- Apstra 4.2.0 or above

## Usage

1. Prepare the PowerPack
- Apstra needs to have a Property Set that is used to manage the power pack. 
- Set up the management property set in Apstra with appropriate values:

  | Field | Purpose | Value/Example |
  |---|---|---|
  | Name | PropertySet name | Ticket Manager |
  | Input Type | Type of input required | Editor |
  | Values | YAML of property values (including blueprints to manage) | (see below) |

  ```yaml
  blueprint_ids: blueprint1, blueprint2
  pause: false
  ```

2. Run PowerPack with Docker 
- Create a setup.yaml, filling in the values as appropriate:
  ```yaml
  snow:
    instance: devxxxxx                            #Service Now Instance
    user:                                         #Service Now Username. Account needs to have permissions to create and edit tickets
  wait_time_seconds: 20                           #Time between checks
  tickets_property_set: tickets                   #Property Set for tickets
  management_property_set: Ticket Manager         #Property Set to manage this automation
                                                  #These are the
                                                  #{
                                                  #    'blueprint_ids': #Comma separated list of blueprint ids to be monitored
                                                  #    'pause': #true or false. automation pauses if true
                                                  #}
  ```
- Set the following shell variables:
  | Variable | Example |
  | -------- | ------- |
  | APSTRA_URL | https://apstra.acme.net | 
  | APSTRA_PORT | 4443 |
  | APSTRA_USER | service_account_user |
  | APSTRA_PASS | topSecretPW1# |
  | SNOW_PASS | snowPass%^3 |
  ```
- Use the following command to run the container. The string `latest` can be replaced with the version you wish to use, like `v1.0.0`.
- `docker run -v $PWD/setup.yaml:/SnowApp/setup.yaml -e APSTRA_URL=$APSTRA_URL -e APSTRA_PORT=$APSTRA_PORT -e APSTRA_USER=$APSTRA_USER -e APSTRA_PASS=$APSTRA_PASS -e SNOW_PASS=$SNOW_PASS snowdemo:latest`
