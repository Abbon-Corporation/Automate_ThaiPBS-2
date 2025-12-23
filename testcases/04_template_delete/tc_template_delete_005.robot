*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

Test setup    common.Open Browser And Navigate To URL    ${url.thaipbs_admin_url}
Test teardown    common.Close Browser And Capture Log

*** Test Cases ***
TC_Template_delete_005 - Delete
    [Tags]    status:ready    automation_id:tc_template_delete_005    test_type:regression    priority:high    platform:int    feature:template    function:template_delete
    [Documentation]    ลบรายการที่สร้างรูปแบบ Custom ที่มีสถานะยังไม่ถึงเวลา
    login_feature.Input Email Password And Sign In To Login    %{email_admin}    %{password_admin}
    home_feature.Verify Page Display Home Component
    home_feature.Tap Main Menu And Submenu    ${home_page['message']}    ${home_page['template_module']}
    template_page.Select Status From Status Dropdown List    ${tc_template_delete_005['status_schedule']}
    template_page.Search Name Template    ${tc_template_delete_005['name_of_custom']}    #ค้นหาชื่อที่สร้างจากเทสเคสที่ create tempalte custom type เนื่องจากหน้าตารางไม่สามารถจับได้ว่าอันไหนเป็น Type อะไร
    template_feature.Delete Scchedule And Inactive Tempalte Success