# Snow Tickets
Apstra Anomalies provide an easy way to observe problems in the network fabric.
Service Now is a popular platform to report problems. This automation tracks the fabric and opens tickets in Service Now if there are problems.


## Requirements

- Apstra 4.2.0 or above
- python 3 or above

## Usage

1. Prepare the PowerPack
- Apstra needs to have a Property Set that is used to manage the power pack. 
- This can be auto-installed with Terraform or done manually:
    
    1.1 Manual Apstra Setup
    - Set up the management property set in Apstra with appropriate values:
    
      | Field | Purpose | Value/Example |
      |---|---|---|
      | Name | PropertySet name | Ticket Manager |
      | Input Type | Type of input required | Editor |
      | Values | YAML of property values (including blueprints to manage) | (see below) |

      ```yaml
      blueprints: blueprint1, blueprint2
      pause: false
      ```

    1.2 Terraform/Tofu Apstra Setup
    - Fill out apstra_snow_setup.sh
    - % source apstra_snow_setup.sh
    - % terraform init&&terraform apply
    - This will set up a Property Set called Ticket Manager with all the blueprints in the environment.
    - Inspect the Property Set and ensure that only the blueprints you want to track are in the list

2. Run PowerPack with Docker 
- Copy setup.yaml.template to setup.yaml. Fill in the values as appropriate.
- Export the APSTRA_PASS and SNOW_PASS passwords.
- % docker build -t snowdemo:latest.
  - At the end of this commend, you will get the id of the image that just got built use it in the next step.
- `docker run -v $PWD/setup.yaml:/SnowApp/setup.yaml -e APSTRA_PASS=$APSTRA_PASS -e SNOW_PASS=$SNOW_PASS snowdemo:latest`

3. DEV-ONLY: Run PowerPack from Commandline
- `pip3 install -r ./requirements.txt`
- copy setup.yaml.template to setup.yaml. Fill in the values as appropriate
- Export the APSTRA_PASS and SNOW_PASS passwords
- start the python script 
   `python snow_tickets.py`
