def lambda_handler(event, context):
   message = f'Hello {event["key1"]} !'
   return {
       'message' : message
   }
