#!/bin/bash

korea, sydnesy mumbai singapore

az group create -n koreacentralrg -l koreacentral
az group create -n australiaeastrg -l australiaeast
az group create -n westindiarg -l westindia
az group create -n southeastasiarg -l southeastasia

az group deployment create -n pingvmcreate -g koreacentralrg --template-file ./LGEVDIPingTestMachine_template4.json
az group deployment create -n pingvmcreate -g australiaeastrg --template-file ./LGEVDIPingTestMachine_template4.json
az group deployment create -n pingvmcreate -g westindiarg --template-file ./LGEVDIPingTestMachine_template4.json
az group deployment create -n pingvmcreate -g southeastasiarg --template-file ./LGEVDIPingTestMachine_template4.json

# ssh to machine 
#
# sudo cat /var/lib/waagent/Microsoft.OSTCExtensions.CustomScriptForLinux-1.5.4/download/0/output.txt
# grab the outputfile


# Clear the environment
#az group delete -n koreacentralrg --no-wait
#az group delete -n australiaeastrg --no-wait
#az group delete -n westindiarg --no-wait
#az group delete -n southeastasiarg --no-wait

