*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

Test setup    common.Open Browser And Navigate To URL    ${url.thaipbs_admin_url}
Test teardown    common.Close Browser And Capture Log

*** Test Cases ***
TC_Template_create_011 - Create
    [Tags]    status:ready    automation_id:tc_template_create_011    test_type:regression    priority:high    platform:int    feature:template    function:template_create
    [Documentation]    สร้าง Template รูปแบบ Style 5 จำนวน 2 ข้อความ ให้มีสถานะกำลังใช้งาน
    login_feature.Input Email Password And Sign In To Login    %{email_admin}    %{password_admin}
    home_feature.Verify Page Display Home Component
    home_feature.Tap Main Menu And Submenu    ${home_page['message']}    ${home_page['template_module']}
    template_feature.Click create template button to create page
    ${create_name_validate}=    template_feature.Input Detail Tempale At Current Date And Time    ${tc_template_create_011['name_input']}    ${tc_template_create_011['message_input']}
    template_feature.Create Template Style5    ${tc_template_Create_011['message_name_input']}    ${tc_template_create_011['left_image_path_01']}    ${tc_template_create_011['right_image_path_01']}    ${tc_template_create_011['lower_image_path_01']}    ${tc_template_create_011['message_templat_input']}    ${tc_template_create_011['color_01']}
    template_feature.Create Template Style5    ${tc_template_Create_011['message_name_input']}    ${tc_template_create_011['left_image_path_02']}    ${tc_template_create_011['right_image_path_02']}    ${tc_template_create_011['lower_image_path_02']}    ${tc_template_create_011['message_templat_input']}    ${tc_template_create_011['color_02']}
    template_page.Click Save Template Button
    Sleep    40
    template_page.Verify With Name When Create Tempalte Success    ${create_name_validate}