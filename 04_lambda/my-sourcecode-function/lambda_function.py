import requests
def lambda_handler(event, context):   
    response = requests.get("https://en.wikipedia.org/wiki/Eduardo_Galeano")
    print(response.text[0:200])
    return response.text
