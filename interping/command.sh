#!/bin/bash

# az group create -n eastusrg -l eastus
# az group create -n westusrg -l westus
# az group create -n canadaeastrg -l canadaeast
# az group create -n brazilsouthrg -l brazilsouth
# az group create -n uksouthrg -l uksouth
# az group create -n westeuroperg  -l westeurope
# az group create -n koreacentral2rg -l koreacentral
# az group create -n westindiarg -l westindia
# az group create -n australiaeastrg  -l australiaeast
# az group create -n southeastasiarg -l southeastasia

# az group deployment create -n pingvmcreate -g eastusrg --template-file ./LGEVDIPingTestMachine_eastusrg.json
# az group deployment create -n pingvmcreate -g westusrg --template-file ./LGEVDIPingTestMachine_westusrg.json
# az group deployment create -n pingvmcreate -g canadaeastrg --template-file ./LGEVDIPingTestMachine_canadaeastrg.json
# az group deployment create -n pingvmcreate -g brazilsouthrg --template-file ./LGEVDIPingTestMachine_brazilsouthrg.json
# az group deployment create -n pingvmcreate -g uksouthrg --template-file ./LGEVDIPingTestMachine_uksouthrg.json
# az group deployment create -n pingvmcreate -g westeuroperg --template-file ./LGEVDIPingTestMachine_westeuroperg.json
# az group deployment create -n pingvmcreate -g koreacentral2rg --template-file ./LGEVDIPingTestMachine_koreacentral2rg.json
# az group deployment create -n pingvmcreate -g westindiarg --template-file ./LGEVDIPingTestMachine_westindiarg.json
# az group deployment create -n pingvmcreate -g australiaeastrg --template-file ./LGEVDIPingTestMachine_australiaeastrg.json
# az group deployment create -n pingvmcreate -g southeastasiarg --template-file ./LGEVDIPingTestMachine_southeastasiarg.json

# az group delete -n eastusrg --no-wait --yes
# az group delete -n westusrg --no-wait --yes
# az group delete -n canadaeastrg --no-wait --yes
# az group delete -n brazilsouthrg --no-wait --yes
# az group delete -n uksouthrg --no-wait --yes
# az group delete -n westeuroperg --no-wait --yes
# az group delete -n koreacentral2rg --no-wait --yes
# az group delete -n westindiarg --no-wait --yes
# az group delete -n australiaeastrg --no-wait --yes
# az group delete -n southeastasiarg --no-wait --yes


eastusID=$(az network vnet show --name eastusvnet -g eastusrg --query id --out tsv)
echo $eastusID
westusID=$(az network vnet show --name westusvnet -g westusrg --query id --out tsv)
echo $westusID
canadaeastID=$(az network vnet show --name canadaeastvnet -g canadaeastrg --query id --out tsv)
echo $canadaeastID
brazilsouthID=$(az network vnet show --name brazilsouthvnet -g brazilsouthrg --query id --out tsv)
echo $brazilsouthID
uksouthID=$(az network vnet show --name uksouthvnet -g uksouthrg --query id --out tsv)
echo $uksouthID
westeuropeID=$(az network vnet show --name westeuropevnet -g westeuroperg --query id --out tsv)
echo $westeuropeID
koreacentralID=$(az network vnet show --name koreacentral2 -g koreacentral2rg --query id --out tsv)
echo $koreacentralID
westindiaID=$(az network vnet show --name westindiavnet -g westindiarg --query id --out tsv)
echo $westindiaID
austrliaeastID=$(az network vnet show --name australiaeastvnet -g australiaeastrg --query id --out tsv)
echo $australiaeastID
southeastasiaID=$(az network vnet show --name southeastasiavnet -g southeastasiarg --query id --out tsv)
echo $southeastasiaID

az network vnet peering create -n koreaToeastus -g koreacentral2rg --vnet-name koreacentral2 --remote-vnet-id $eastusID --allow-vnet-access
az network vnet peering create -n eastustok -g eastusrg --vnet-name eastusvnet --remote-vnet-id $koreacentralID --allow-vnet-access

az network vnet peering create -n koreaTowestus -g koreacentral2rg --vnet-name koreacentral2 --remote-vnet-id $westusID --allow-vnet-access
az network vnet peering create -n westustok -g westusrg --vnet-name westusvnet --remote-vnet-id $koreacentralID --allow-vnet-access

az network vnet peering create -n koreaTocanadaeast -g koreacentral2rg --vnet-name koreacentral2 --remote-vnet-id $canadaeastID --allow-vnet-access
az network vnet peering create -n canadaeasttok -g canadaeastrg --vnet-name canadaeastvnet --remote-vnet-id $koreacentralID --allow-vnet-access

az network vnet peering create -n koreaTobrazilsouth -g koreacentral2rg --vnet-name koreacentral2 --remote-vnet-id $brazilsouthID --allow-vnet-access
az network vnet peering create -n brazilsouthtok -g brazilsouthrg --vnet-name brazilsouthvnet --remote-vnet-id $koreacentralID --allow-vnet-access

az network vnet peering create -n koreaTouksouth -g koreacentral2rg --vnet-name koreacentral2 --remote-vnet-id $uksouthID --allow-vnet-access
az network vnet peering create -n uksouthtok -g uksouthrg --vnet-name uksouthvnet --remote-vnet-id $koreacentralID --allow-vnet-access

az network vnet peering create -n koreaTowesteurope -g koreacentral2rg --vnet-name koreacentral2 --remote-vnet-id $westeuropeID --allow-vnet-access
az network vnet peering create -n westeuropetok -g westeuroperg --vnet-name westeuropevnet --remote-vnet-id $koreacentralID --allow-vnet-access

az network vnet peering create -n koreaTowestindia -g koreacentral2rg --vnet-name koreacentral2 --remote-vnet-id $westindiaID --allow-vnet-access
az network vnet peering create -n westindiatok -g westindiarg --vnet-name westindiavnet --remote-vnet-id $koreacentralID --allow-vnet-access

az network vnet peering create -n koreaToaustraliaeast -g koreacentral2rg --vnet-name koreacentral2 --remote-vnet-id $australiaeastID --allow-vnet-access
az network vnet peering create -n australiaeasttok -g australiaeastrg --vnet-name australiaeastvnet --remote-vnet-id $koreacentralID --allow-vnet-access

az network vnet peering create -n koreaTosoutheastasia -g koreacentral2rg --vnet-name koreacentral2 --remote-vnet-id $southeastasiaID --allow-vnet-access
az network vnet peering create -n southeastasiatok -g southeastasiarg --vnet-name southeastasiavnet --remote-vnet-id $koreacentralID --allow-vnet-access

