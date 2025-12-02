#Execute command
#robocop
robot -d result -v LANG:en -v IS_CICD:false -i automation_id:tc_template_001 . 
# python resources/testrail_result_upload.py
#pabot --processes 5 -d result -v LANG:en -v IS_CICD:true -i status:ready .
