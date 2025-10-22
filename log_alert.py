import requests 
import json 

# Slack webhook URL 
slack_webhook_url = "<slack api addr>" 
names = [] 
addresses = [] 
# addr.txt 
with open('addr.txt', 'r',encoding='utf-8') as file: 
  for line in file: 
    name, address = line.strip().split() 
    names.append(name) 
    addresses.append(address) 
for name, address in zip(names, addresses): 
  url = f"<api_url>" 
  response = requests.get(url) 
  
  if response.status_code == 200: 
    # API에서 받은 JSON 데이터 파싱 
      data = response.json() 
    # data와 records 필드가 존재하고, records가 None이 아닌지 확인 
      records = data.get('data', {}).get('records') 
      if records: # 각 레코드에서 worker의 name 추출 및 메시지 전송 
          for record in records:
            worker_name = record.get("name") 
            if worker_name: 4
              # Slack으로 메시지 보내기 (이름과 worker name 둘 다 표시) 
              slack_message = { "text": f"{name} : {worker_name}" } 
              requests.post(slack_webhook_url, data=json.dumps(slack_message)) 
              print(f"Sent to Slack: {name} - Worker Name: {worker_name}") 
            else: print(f"No valid records found for {address}") 
        else: print(f"Failed to fetch data for {address}, status code: {response.status_code}")
