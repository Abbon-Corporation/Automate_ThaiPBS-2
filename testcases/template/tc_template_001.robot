*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

Test setup    common.Open Browser And Navigate To URL    ${url.thaipbs_admin_url}
Test teardown    common.Close Browser And Capture Log

*** Test Cases ***
TC_Template_001 - Login
    [Tags]    status:ready    automation_id:tc_template_001    test_type:regression    priority:high    platform:ui    feature:master_data    function:master_data_list
    [Documentation]    สร้าง Template รูปแบบ Style 1 จำนวน 1 ข้อความ ให้มีสถานะยังไม่ถึงเวลา
    login_feature.Input Email Password And Sign In To Login    %{email_admin}    %{password_admin}
    home_feature.Verify Page Display Home Component
    home_feature.Tap Main Menu And Submenu    ${home_page['message']}    ${home_page['template_module']}
    template_feature.Click create template button to create page
    template_feature.Input Detail Tempale At Schedule Date And Time    ${tc_template_001['name_input']}    ${tc_template_001['message_input']}
    template_feature.Create Template Style1    ${tc_template_001['message_name_input']}    ${tc_template_001['upper_image_path']}    ${tc_template_001['lower_image_path']}    ${tc_template_001['message_templat_input']}    ${tc_template_001['color']}