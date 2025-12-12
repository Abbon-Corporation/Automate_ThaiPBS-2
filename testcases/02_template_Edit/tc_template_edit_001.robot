*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

Test setup    common.Open Browser And Navigate To URL    ${url.thaipbs_admin_url}
Test teardown    common.Close Browser And Capture Log

*** Test Cases ***
TC_Template_edit_001 - Edit
    [Tags]    status:ready    automation_id:tc_template_edit_001    test_type:regression    priority:high    platform:int    feature:template    function:template_edit
    [Documentation]    ตรวจสอบการแก้ไข Template จากสถานะ ยังไม่ถึงเวลา เป็น กำลังใช้งานแล้วรอให้หมดอายุ แก้ไขรูปแบบข้อความจาก Default เป็น Custom กดปุ่ม บันทึก
    login_feature.Input Email Password And Sign In To Login    %{email_admin}    %{password_admin}
    home_feature.Verify Page Display Home Component
    home_feature.Tap Main Menu And Submenu    ${home_page['message']}    ${home_page['template_module']}
    template_feature.Filter At Status And Click To Edit Page    ${tc_template_edit_001['status_schedule']}    ${tc_template_edit_001['name_of_defualt_type']}
    template_feature.Clear Detail Tempale
    ${create_name_validate}=    template_feature.Edit Detail Tempale At Current Date And Time    ${tc_template_edit_001['name_input']}    ${tc_template_edit_001['message_input']}
    template_feature.Edit Template Message DefualtType To CustomType    ${tc_template_edit_001['message_name_input']}    ${tc_template_edit_001['json_input']}
    Sleep    2
    template_page.Click Save Template Button
    Sleep    30
    template_page.Verify With Name When Edit Tempalte Success    ${create_name_validate}