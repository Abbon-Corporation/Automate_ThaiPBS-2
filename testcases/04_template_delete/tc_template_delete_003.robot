*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

Test setup    common.Open Browser And Navigate To URL    ${url.thaipbs_admin_url}
Test teardown    common.Close Browser And Capture Log

*** Test Cases ***
TC_Template_delete_003 - Delete
    [Tags]    status:ready    automation_id:tc_template_delete_003    test_type:regression    priority:high    platform:int    feature:template    function:template_delete
    [Documentation]    ลบรายการที่สร้างรูปแบบ Style 1 - 5 จำนวน 5 ข้อความ ที่มีสถานะปิดใช้งาน
    login_feature.Input Email Password And Sign In To Login    %{email_admin}    %{password_admin}
    home_feature.Verify Page Display Home Component
    home_feature.Tap Main Menu And Submenu    ${home_page['message']}    ${home_page['template_module']}
    template_page.Select Status From Status Dropdown List    ${tc_template_delete_003['status_inactive']}
    template_page.Search Name Template    ${tc_template_delete_003['name_of_automate']}    #ลบเฉพาะรายการที่สร้างด้วยระบบ Automate
    template_feature.Delete Scchedule And Inactive Tempalte Success