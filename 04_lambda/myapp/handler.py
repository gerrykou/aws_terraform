# Tell python to include the package directory
import sys
sys.path.insert(0, 'package/')

import requests

def lambda_handler(event, context):

    my_ip = requests.get("https://api.ipify.org?format=json").json()

    return {"Public Ip": my_ip["ip"]}
