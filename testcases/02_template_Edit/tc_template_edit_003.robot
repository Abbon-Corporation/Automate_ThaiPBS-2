*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

Test setup    common.Open Browser And Navigate To URL    ${url.thaipbs_admin_url}
Test teardown    common.Close Browser And Capture Log

*** Test Cases ***
TC_Template_edit_003 - Edit
    [Tags]    status:ready    automation_id:tc_template_edit_003    test_type:regression    priority:high    platform:int    feature:template    function:template_edit
    [Documentation]    ตรวจสอบการแก้ไข Template จากสถานะ ปิดใช้งาน เป็น ยังไม่ถึงเวลารอให้เป็นกำลังใช้งาน แก้ไขรูปแบบข้อความจาก Default เป็น Custom แล้วกดปุ่ม บันทึก
    login_feature.Input Email Password And Sign In To Login    %{email_admin}    %{password_admin}
    home_feature.Verify Page Display Home Component
    home_feature.Tap Main Menu And Submenu    ${home_page['message']}    ${home_page['template_module']}
    template_feature.Filter At Status And Click To Edit Page    ${tc_template_edit_003['status_inactive']}    ${tc_template_edit_003['name_of_defualt_type']}
    template_feature.Clear Detail Tempale
    ${create_name_validate}=    template_feature.Edit Detail Tempale At Schedule Date And Time To Expired 1 Min    ${tc_template_edit_003['name_input']}    ${tc_template_edit_003['message_input']}
    template_feature.Edit Template Message CustomType To DefualtType    ${tc_template_edit_003['message_name_input']}    ${tc_template_edit_003['upper_image_path_01']}    ${tc_template_edit_003['lower_image_path_01']}    ${tc_template_edit_003['message_templat_input']}    ${tc_template_edit_003['color_01']}
    Sleep    2
    template_page.Click Save Template Button
    Sleep    40
    template_page.Verify With Name When Edit Tempalte Success    ${create_name_validate}
    template_feature.Seach And Publish Template    ${create_name_validate}
    Sleep    30    #รอเวลาให้เปลี่ยนเป็น กำลังใช้งาน
    template_feature.Seach And Wait For Active Template    ${create_name_validate}