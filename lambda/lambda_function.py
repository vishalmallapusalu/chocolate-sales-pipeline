import base64
import json
import boto3
from datetime import datetime

# Initialize SNS Client
sns_client = boto3.client('sns', region_name='us-east-1')
sns_topic_arn = 'arn:aws:sns:us-east-1:730335313532:chocolate-sales-alerts'  # ✅ Your SNS Topic ARN

def lambda_handler(event, context):
    for record in event['Records']:
        try:
            payload = base64.b64decode(record["kinesis"]["data"]).decode('utf-8')
            data = json.loads(payload)

            # Extract Fields
            timestamp = data.get('timestamp')
            product = data.get('product')
            amount = float(data.get('amount', 0))
            quantity = int(data.get('quantity', 0))
            customer_type = data.get('customer_type')
            location = data.get('location')

            # High Value Sale Check
            high_value_flag = "Yes" if amount > 50 else "No"
            formatted_time = datetime.fromisoformat(timestamp).isoformat()

            processed_record = {
                "timestamp": formatted_time,
                "product": product,
                "amount": amount,
                "quantity": quantity,
                "customer_type": customer_type,
                "location": location,
                "high_value_flag": high_value_flag
            }

            print("✅ Processed Chocolate Sale:", json.dumps(processed_record))

            # Send to SNS if High Value
            if high_value_flag == "Yes":
                sns_client.publish(
                    TopicArn=sns_topic_arn,
                    Message=json.dumps(processed_record),  # Send JSON message
                    Subject="🚨 High-Value Chocolate Sale"
                )
                print("✅ SNS Alert Sent")
            else:
                print("ℹ️ Regular sale, no alert sent.")

        except Exception as e:
            print(f"❌ Error processing record: {e}")
            print("Offending record:", record)

    return {'statusCode': 200, 'body': json.dumps('✅ Successfully processed records.')}
