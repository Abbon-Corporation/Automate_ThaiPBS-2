*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

Test setup    common.Open Browser And Navigate To URL    ${url.thaipbs_admin_url}
Test teardown    common.Close Browser And Capture Log

*** Test Cases ***
TC_Template_delete_001 - Delete
    [Tags]    status:ready    automation_id:tc_template_delete_001    test_type:regression    priority:high    platform:int    feature:template    function:template_delete
    [Documentation]    ลบรายการที่สร้างรูปแบบ Style 2 จำนวน 1 ข้อความ ที่มีสถานะกำลังใช้งาน
    login_feature.Input Email Password And Sign In To Login    %{email_admin}    %{password_admin}
    home_feature.Verify Page Display Home Component
    home_feature.Tap Main Menu And Submenu    ${home_page['message']}    ${home_page['template_module']}
    template_page.Select Status From Status Dropdown List    ${tc_template_delete_001['status_active']}
    template_feature.Verify Template Should Not Have Action Button    ${tc_template_delete_001['delete_action']}