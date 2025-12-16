*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

Test setup    common.Open Browser And Navigate To URL    ${url.thaipbs_admin_url}
Test teardown    common.Close Browser And Capture Log

*** Test Cases ***
TC_Template_create_020 - Create
    [Tags]    status:ready    automation_id:tc_template_create_020    test_type:regression    priority:high    platform:int    feature:template    function:template_create
    [Documentation]    สร้าง Template รูปแบบ Style 2 จำนวน 5 ข้อความ ให้มีสถานะยังไม่ถึงเวลาและรอให้เลยเวลาสิ้นสุด
    login_feature.Input Email Password And Sign In To Login    %{email_admin}    %{password_admin}
    home_feature.Verify Page Display Home Component
    home_feature.Tap Main Menu And Submenu    ${home_page['message']}    ${home_page['template_module']}
    template_feature.Click create template button to create page
    ${create_name_validate}=    template_feature.Input Detail Tempale At Schedule Date And Time To Expired 1 Min    ${tc_template_create_020['name_input']}    ${tc_template_create_020['message_input']}
    template_feature.Create Template Style2    ${tc_template_Create_020['message_name_input']}    ${tc_template_create_020['left_image_path_01']}    ${tc_template_create_020['right_image_path_01']}    ${tc_template_create_020['message_templat_input']}    ${tc_template_create_020['color_01']}
    template_feature.Create Template Style2    ${tc_template_Create_020['message_name_input']}    ${tc_template_create_020['left_image_path_02']}    ${tc_template_create_020['right_image_path_02']}    ${tc_template_create_020['message_templat_input']}    ${tc_template_create_020['color_02']}
    template_feature.Create Template Style2    ${tc_template_Create_020['message_name_input']}    ${tc_template_create_020['left_image_path_03']}    ${tc_template_create_020['right_image_path_03']}    ${tc_template_create_020['message_templat_input']}    ${tc_template_create_020['color_03']}
    template_feature.Create Template Style2    ${tc_template_Create_020['message_name_input']}    ${tc_template_create_020['left_image_path_04']}    ${tc_template_create_020['right_image_path_04']}    ${tc_template_create_020['message_templat_input']}    ${tc_template_create_020['color_04']}
    template_feature.Create Template Style2    ${tc_template_Create_020['message_name_input']}    ${tc_template_create_020['left_image_path_05']}    ${tc_template_create_020['right_image_path_05']}    ${tc_template_create_020['message_templat_input']}    ${tc_template_create_020['color_05']}
    template_page.Click Save Template Button
    Sleep    40
    template_page.Verify With Name When Create Tempalte Success    ${create_name_validate}
    Sleep    140    #รอเวลาให้เปลี่ยนเป็น กำลังใช้งาน แล้วเปลี่ยนเป็น หมดเวลา
    template_feature.Seach And Wait For Expired Template    ${create_name_validate}