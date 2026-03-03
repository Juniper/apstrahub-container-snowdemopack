# Snow Tickets
Apstra Anomalies provide an easy way to observe problems in the network fabric.
Service Now is a popular platform to report problems. This automation tracks the fabric and opens tickets in Service Now if there are problems.


## Requirements

- Apstra 4.2.0 or above
- python 3 or above

## Usage

1. Prepare the PowerPack
- Apstra needs to have a Property Set that is used to manage the power pack. 
- Set up the management property set in Apstra with appropriate values
- The Property Set should be called 'Ticket Manager'
- The Property Set should have the following structure :
  {
      "pause" : false
      "blueprint_ids" :[]            #String list of blueprint ids
      "ignore_anomalies": [],        #List of Anomalies to Ignore
      "ignore_device" : [],          #List of device hostnames to ignore
      "include_only_anomalies" : [], #List of anomalies to include, all others will be ignored
      "include_only_devices" : [],   #List of devices to include, all others will be ignored
      "include_only_severity": [],   #List of severities to include, all others will be ignored
    }

2. Run PowerPack with Docker 
- copy setup.yaml.template to setup.yaml. Fill in the values as appropriate
- Export the APSTRA_PASS and SNOW_PASS passwords
- % docker build .  
  - At the end of this commend, you will get the id of the image that just got built use it in the next step
- docker run  -v $PWD/setup.yaml:/SnowApp/setup.yaml -e APSTRA_PASS=$APSTRA_PASS -e SNOW_PASS=$SNOW_PASS <docker image id from previous step>

3. Run PowerPack from Commandline
- % pip3 install -r ./requirements.txt
- copy setup.yaml.template to setup.yaml. Fill in the values as appropriate
- Export the APSTRA_PASS and SNOW_PASS passwords
- start the python script 
   % python snow_tickets.py


