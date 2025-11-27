import os
import xml.etree.ElementTree as ET
import requests

# TestRail Configuration
TESTRAIL_URL = os.getenv("TESTRAIL_URL")
TESTRAIL_USERNAME = os.getenv("TESTRAIL_USERNAME")
TESTRAIL_API_KEY = os.getenv("TESTRAIL_API_KEY")
TESTRAIL_RUN_ID = os.getenv("TESTRAIL_RUN_ID")

# Parse Robot Framework output.xml
def parse_robot_results(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    
    test_results = []
    for test in root.findall(".//test"):
        automation_id = None
        for tag in test.findall("tag"):
            if tag.text.startswith("automation_id:"):
                automation_id = tag.text.split(":tc")[1]
        
        if automation_id:
            status = test.find("status").attrib["status"]
            test_results.append({
                "automation_id": automation_id,
                "status": status
            })
    
    return test_results

# Map Robot status to TestRail status
def map_status(robot_status):
    return 1 if robot_status == "PASS" else 5  # 1 = Passed, 5 = Failed in TestRail

# Upload results to TestRail
def upload_results(results):
    for result in results:
        test_case_id = result["automation_id"]
        status_id = map_status(result["status"])
        
        url = f"{TESTRAIL_URL}/index.php?/api/v2/add_result_for_case/{TESTRAIL_RUN_ID}/{test_case_id}"
        headers = {"Content-Type": "application/json"}
        data = {"status_id": status_id, "comment": "Executed by automation test"}
        
        response = requests.post(url, json=data, auth=(TESTRAIL_USERNAME, TESTRAIL_API_KEY), headers=headers)
        print(f"Uploaded result for Case {test_case_id}: {response.status_code} >> {response.content}")

# Execute
test_results = parse_robot_results("result/output.xml")
upload_results(test_results)