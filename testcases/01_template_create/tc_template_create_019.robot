*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

Test setup    common.Open Browser And Navigate To URL    ${url.thaipbs_admin_url}
Test teardown    common.Close Browser And Capture Log

*** Test Cases ***
TC_Template_create_019 - Create
    [Tags]    status:ready    automation_id:tc_template_create_019    test_type:regression    priority:high    platform:int    feature:template    function:template_create
    [Documentation]    สร้าง Template รูปแบบ Style 1 จำนวน 1 ข้อความ ให้มีสถานะยังไม่ถึงเวลาและรอให้เลยเวลาสิ้นสุด
    login_feature.Input Email Password And Sign In To Login    %{email_admin}    %{password_admin}
    home_feature.Verify Page Display Home Component
    home_feature.Tap Main Menu And Submenu    ${home_page['message']}    ${home_page['template_module']}
    template_feature.Click create template button to create page
    ${create_name_validate}=    template_feature.Input Detail Tempale At Schedule Date And Time To Expired 1 Min    ${tc_template_create_019['name_input']}    ${tc_template_create_019['message_input']}
    template_feature.Create Template Style1    ${tc_template_create_019['message_name_input']}    ${tc_template_create_019['upper_image_path']}    ${tc_template_create_019['lower_image_path']}    ${tc_template_create_019['message_templat_input']}    ${tc_template_create_019['color']}
    template_page.Click Save Template Button
    Sleep    15
    template_page.Verify With Name When Create Tempalte Success    ${create_name_validate}
    Sleep    140    #รอเวลาให้เปลี่ยนเป็น กำลังใช้งาน แล้วเปลี่ยนเป็น หมดเวลา
    template_feature.Seach And Wait For Expired Template    ${create_name_validate}