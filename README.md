# Zabbix template for monitoring Windows Failover Cluster

This repository contains a Zabbix template that creates a basic item and trigger for the state of a Windows Failover Cluster.
Includes
 - Nodes
 - Core Cluster Resources (eg. name service, witness, storage qos resource etc)
 - Virtual machines
 - Virtual machine configurations


## Installation
1. **Import the Template into Zabbix:**
    - Download the preferred template format (`zbx_export_templates.xml`, `zbx_export_templates.yaml`, or `zbx_export_templates.json`) from this repository.
    - Log in to your Zabbix web interface.
    - Navigate to `Configuration` > `Templates`.
    - Click on `Import` in the top right corner.
    - Choose the downloaded template file and import it.

2. **Setup**
    - Add the `UserParameters` from `zabbix_agentd.conf` to the `zabbix_agentd.conf` on the host you want to monitor eg. `C:\Program Files\Zabbix Agent\zabbix_agentd.conf` 
    - Download the `CustomScripts` directory from this repository and place it in your Zabbix Agent directory eg. `C:\Program Files\Zabbix Agent\CustomScripts`
    - In Zabbix, link the template to a host
    - Restart the Zabbix Agent on your host
