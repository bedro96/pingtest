### Ping(RTT) Testing from Azure ###

The intend of this test to identify the best Azure region to serve a service.
The customer would like to establish three regional centers and result of this activity will 
provide a insight for making a decision. This script has been verified to be working on Ubuntu 16.04.

## Deploy Virtual with ARM template ##

There are three templates to reprsents Americas, EMEA, and APJ.
When the template is deployed, it will download and run the script.

# Create a resource group # 
``` bash
az group create -n eastusrg -l eastus
```

# Deploy the ARM template #
``` bash
az group deployment create -n pingvmcreate -g eastusrg --template-file ./LGEVDIPingTestMachine_template.json
```

As soon as the virtual machine is deployed, the ping script is executed.
The script is self downloads the target and accumulates the result in min, avg, and max to output.txt

# Retreiving the outputfile #
Login to the virtual machine and execute the following command
``` bash
sudo cat /var/lib/waagent/Microsoft.OSTCExtensions.CustomScriptForLinux-1.5.4/download/0/output.txt
```

## Cleaning up the environment ##
``` bash
az group delete -n eastusrg --no-wait --yes
```
