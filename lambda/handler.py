import json
import os

def lambda_handler(event, context):

    file_path = os.path.join(os.path.dirname(__file__), "frontend/index.html")

    with open(file_path, "r", encoding="utf-8") as f:
        html_content = f.read()

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "text/html"
        },
        "body": html_content
    }