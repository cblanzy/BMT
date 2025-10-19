import requests
import json

print("Searching for 'tropical' in bowwwl.com API...")

for page in range(0, 20):
    try:
        response = requests.get(f"https://www.bowwwl.com/restapi/balls/v2?page={page}")
        if response.status_code == 200:
            balls = response.json()
            if not balls:
                print(f"No more results after page {page-1}")
                break

            for ball in balls:
                if 'tropical' in ball.get('ball_name', '').lower():
                    print(f"Found on page {page}: {ball['ball_name']} (ID: {ball['ball_id']})")
    except Exception as e:
        print(f"Error on page {page}: {e}")
        break

print("Search complete")
