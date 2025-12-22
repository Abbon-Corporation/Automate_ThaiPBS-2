*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

Test setup    common.Open Browser And Navigate To URL    ${url.thaipbs_admin_url}
Test teardown    common.Close Browser And Capture Log

*** Test Cases ***
TC_Template_edit_002 - Edit
    [Tags]    status:ready    automation_id:tc_template_edit_002    test_type:regression    priority:high    platform:int    feature:template    function:template_edit
    [Documentation]    ตรวจสอบการแก้ไข Template จากสถานะ กำลังใช้งาน ตรวจสอบหน้า List และหน้า Detail
    login_feature.Input Email Password And Sign In To Login    %{email_admin}    %{password_admin}
    home_feature.Verify Page Display Home Component
    home_feature.Tap Main Menu And Submenu    ${home_page['message']}    ${home_page['template_module']}
    template_page.Select Status From Status Dropdown List    ${tc_template_edit_002['status_active']}
    template_feature.Verify Template Should Not Have Action Button    ${tc_template_edit_002['edit_action']}
    template_feature.Verify Edit Button On View Page Should Not Have