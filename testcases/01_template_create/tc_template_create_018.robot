*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

Test setup    common.Open Browser And Navigate To URL    ${url.thaipbs_admin_url}
Test teardown    common.Close Browser And Capture Log

*** Test Cases ***
TC_Template_create_018 - Create
    [Tags]    status:ready    automation_id:tc_template_create_018    test_type:regression    priority:high    platform:int    feature:template    function:template_create
    [Documentation]    สร้าง Template รูปแบบ Custom จำนวน 1 ข้อความ  ให้มีสถานะยังไม่ถึงเวลาและกดปิดการใช้งานที่หน้า List
    login_feature.Input Email Password And Sign In To Login    %{email_admin}    %{password_admin}
    home_feature.Verify Page Display Home Component
    home_feature.Tap Main Menu And Submenu    ${home_page['message']}    ${home_page['template_module']}
    template_feature.Click create template button to create page
    ${create_name_validate}=    template_feature.Input Detail Tempale At Current Date And Time    ${tc_template_create_018['name_input']}    ${tc_template_create_018['message_input']}
    template_feature.Create Template Custom    ${tc_template_create_018['message_name_input']}    ${tc_template_create_018['json_input']}
    Sleep    2
    template_page.Click Save Template Button
    Sleep    40
    template_page.Verify With Name When Create Tempalte Success    ${create_name_validate}
    template_feature.Seach And Inactive Template For Active Status Record    ${create_name_validate}