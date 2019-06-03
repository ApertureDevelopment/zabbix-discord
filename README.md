# Zabbix-Discord Alertscript

This script allows you to post status updates from Zabbix to a webhook.

# Installation
1. Get and Install [Discord.sh](https://github.com/ChaoticWeg/discord.sh)
2. Clone this repository in your alertscript folder.
3. Edit zabbix-discord.sh and fill out those variables:
-- discordsh_path = the full path to the discord.sh script
-- webhook_url = the webhook url for the channel to post into
-- monitor_url = the url to a monitor website like statuspage or cachet. You can also fill in a link to your website.
4. Setup a new media type in Zabbix
4.1 Name: Whatever you want
4.2 Type: Script
4.3 Script name: zabbix_discord.sh
4.4 Script parameters:
4.4.1 {ALERT.MESSAGE}
4.4.2 {ALERT.SUBJECT}
5. Add a new Action in Zabbix. Now this is important, to be able to give the script enough parameters, the message needs to be a json string. Here a few examples:

#### Operations
Subject: ````Problem: {EVENT.NAME}````

Message:
````{"msg":"Problem started at {EVENT.TIME} on {EVENT.DATE}\nProblem name: {EVENT.NAME}\nHost: {HOST.NAME}\nSeverity: {EVENT.SEVERITY}\n\nOriginal problem ID: {EVENT.ID}\n{TRIGGER.URL}","ack":"{EVENT.ACK.STATUS}","sev":{TRIGGER.NSEVERITY},"status":"{TRIGGER.STATUS}"}````

#### Recovery operations
Subject: ````Resolved: {EVENT.NAME}````

Message: 
````{"msg":"Problem has been resolved at {EVENT.RECOVERY.TIME} on {EVENT.RECOVERY.DATE}\nProblem name: {EVENT.NAME}\nHost: {HOST.NAME}\nSeverity: {EVENT.SEVERITY}\n\nOriginal problem ID: {EVENT.ID}\n{TRIGGER.URL}","ack":"{EVENT.ACK.STATUS}","sev":{TRIGGER.NSEVERITY},"status":"{TRIGGER.STATUS}"}````

#### Update operations
Subject: ````Updated problem: {EVENT.NAME}````

Message:
````{"msg":"{USER.FULLNAME} {EVENT.UPDATE.ACTION} problem at {EVENT.UPDATE.DATE} {EVENT.UPDATE.TIME}.\n{EVENT.UPDATE.MESSAGE}\n\nCurrent problem status is {EVENT.STATUS}, acknowledged: {EVENT.ACK.STATUS}.","ack":"{EVENT.ACK.STATUS}","sev":{TRIGGER.NSEVERITY},"status":"{TRIGGER.STATUS}"}````


# Additional informations
This script is licenced under [GNU General Public License v3.0](https://github.com/ApertureDevelopment/zabbix-discord/blob/master/LICENSE)

#### About us:
Website: https://www.Aperture-Development.de
Discord: https://discordapp.com/invite/JpDPa6w
