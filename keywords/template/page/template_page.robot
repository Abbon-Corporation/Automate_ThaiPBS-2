*** Settings ***
Resource    ${CURDIR}/../../../resources/import.robot

*** Variables ***
${craete_template_bt}    xpath=//button[@class="items-center justify-center whitespace-nowrap rounded-[4px] font-normal transition-colors focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 bg-primary py-2 px-5 text-lg flex gap-2 text-white"]
${craete_template_txt}    xpath=//span[text()="${template_module['create_txt']}"]
${password_login_input}    xpath=//*[@name="password"]
${signin_login_button}    xpath=//*[@type="submit"]
${input_tempale_name_elm}    xpath=//input[@placeholder="ชื่อเทมเพลต"]
${input_message_elm}    xpath=//*[@placeholder="ข้อความ"]
${tap_start_date_elm}    xpath=//button[contains(.,'ระบุวันที่เริ่มต้น')]
${current_day_elm}    xpath=//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-[4px] transition-colors focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 px-4 py-2 text-sm text-primary font-normal']
${tap_end_date_elm}    xpath=//button[contains(.,'ระบุวันที่สิ้นสุด')]
${tap_start_time_elm}    xpath=//input[@placeholder='ระบุเวลาเริ่มต้น']
${current_time_elm}    xpath=//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-[4px] transition-colors focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground px-4 py-2 text-primary text-sm font-normal']
${tap_end_time_elm}    xpath=//input[@placeholder='ระบุเวลาสิ้นสุด']
${create_massage_tempalte_bt}    xpath=//button[@class='w-full h-14 border border-dashed border-primary text-primary rounded-md hover:bg-brand-50 transition-colors disabled:opacity-30 disabled:cursor-not-allowed disabled:hover:bg-transparent']
${input_message_tempale_name_elm}    xpath=//input[@name="name"]
${defualt_tab}    xpath=//button[text()="Default"]
${custom_tab}    xpath=//button[contains(.,'Custom')]
${style1_elm}    xpath=//*[@class="flex flex-col items-center justify-between gap-2 border w-[94px] min-h-[120px] rounded-lg transition-all duration-200 ease-in-out p-2 hover:-translate-y-1 hover:cursor-pointer border-primary bg-brand-50"]
${style2_elm}    xpath=//*[@class="flex flex-col items-center justify-between gap-2 border w-[94px] min-h-[120px] rounded-lg transition-all duration-200 ease-in-out p-2 hover:-translate-y-1 hover:cursor-pointer border-border bg-white"][1]
${style3_elm}    xpath=//*[@class="flex flex-col items-center justify-between gap-2 border w-[94px] min-h-[120px] rounded-lg transition-all duration-200 ease-in-out p-2 hover:-translate-y-1 hover:cursor-pointer border-border bg-white"][2]
${style4_elm}    xpath=//*[@class="flex flex-col items-center justify-between gap-2 border w-[94px] min-h-[120px] rounded-lg transition-all duration-200 ease-in-out p-2 hover:-translate-y-1 hover:cursor-pointer border-border bg-white"][3]
${style5_elm}    xpath=//*[@class="flex flex-col items-center justify-between gap-2 border w-[94px] min-h-[120px] rounded-lg transition-all duration-200 ease-in-out p-2 hover:-translate-y-1 hover:cursor-pointer border-border bg-white"][4]
${import_image_elm}    xpath=//input[@accept="image/jpeg,.jpg,.jpeg,image/png,.png"]
${save_message_template_elm}    xpath=(//button[@type='submit'])[2]
${message_elm}    xpath=//*[@class="flex min-h-[60px] rounded-md border border-input bg-transparent px-3 py-2 text-sm shadow-sm placeholder:text-color-text-disabled focus-visible:outline-none focus-visible:border-primary disabled:cursor-not-allowed disabled:opacity-50 aria-[invalid=true]:border-error w-full"]
${save_template_elm}    xpath=//button[text()="บันทึก"]
${name_template_elm}    xpath=//tr[1]//span[@class='line-clamp-1 cursor-pointer hover:underline hover:text-brand']
${json_input_elm}    xpath=//*[@placeholder="field.flex_message.custom.json_code"]
${search_key_elm}    xpath=//input[@placeholder='ค้นหาชื่อเทมเพลต']
${seach_bt}    xpath=//button[text()="ค้นหา"]
${more_action_bt}    xpath=//*[@class='p-1 border border-error-100 rounded cursor-pointer']
${inactive_bt01}    xpath=//*[@class='relative select-none items-center rounded-sm text-sm outline-none transition-colors focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0 min-w-60 flex gap-3 py-2.5 px-4 hover:bg-white cursor-pointer'][4]
${inactive_bt02}    xpath=//*[@class='relative select-none items-center rounded-sm text-sm outline-none transition-colors focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0 min-w-60 flex gap-3 py-2.5 px-4 hover:bg-white cursor-pointer'][3]
${view_detail}    xpath=//div[@role='menuitem'][1]
${confirm_inactive_bt}    xpath=//*[@class="inline-flex items-center justify-center whitespace-nowrap rounded-[4px] transition-colors focus-visible:outline-none disabled:pointer-events-none py-2 disabled:bg-disabled disabled:text-gray-400 disabled:opacity-1 cursor-pointer bg-primary text-white text-lg font-normal px-6"]
${confirm_time_bt}    xpath=//button[text()="ยืนยัน"]
${dropdown_status_bt}    xpath=//button[@class='flex w-full items-center justify-between whitespace-nowrap border border-border data-[state=open]:border-primary bg-background px-3 py-2 text-sm ring-offset-background focus:outline-none disabled:cursor-not-allowed disabled:opacity-50 [&>span]:line-clamp-1 data-[placeholder]:text-black-alpha-100 aria-[invalid=true]:border-error h-10 rounded shadow-none']
${edit_bt}    xpath=//*[@class='relative select-none items-center rounded-sm text-sm outline-none transition-colors focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0 min-w-60 flex gap-3 py-2.5 px-4 hover:bg-white cursor-pointer'][2]
${start_date_el}    xpath=//*[@class="inline-flex items-center whitespace-nowrap transition-colors focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 px-4 py-2 w-full h-10 text-sm text-black placeholder:text-black-alpha-100 font-normal justify-start text-left bg-white border border-border shadow-none rounded"]
${edit_icon_first}    xpath=//button[@class='inline-flex items-center justify-center whitespace-nowrap rounded-[4px] text-lg font-normal transition-colors focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 border bg-transparent text-primary shadow-sm hover:bg-accent hover:text-accent-foreground border-color-border-split-brand size-[30px]'][1]
${side_menu_icon}    xpath=//button[@class='inline-flex items-center justify-center whitespace-nowrap text-lg font-normal transition-colors focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 absolute top-14 -right-4 size-8 rounded-full cursor-pointer bg-s-primary hover:bg-s-primary-accent dark:border dark:border-b-primary shadow-lg']
${template_list_txt}    xpath=//*[@class="line-clamp-1 cursor-pointer hover:underline hover:text-brand"]
${more_action_el}    xpath=//div[@role='menuitem']
${edit_button_view_page}    xpath=//button[text()="แก้ไข"]
${delete_shcedule_bt}    xpath=//*[@role="menuitem"][5]
${delete_expired_bt}    xpath=//*[@role="menuitem"][3]
${confirm_delete_bt}    xpath=//button[text()="ยืนยัน"]
${publish_bt}    xpath=//div[@role='menuitem'][4]
${confirm_delete_bt}    xpath=//*[@class="inline-flex items-center justify-center whitespace-nowrap rounded-[4px] transition-colors focus-visible:outline-none disabled:pointer-events-none py-2 disabled:bg-disabled disabled:text-gray-400 disabled:opacity-1 cursor-pointer bg-primary text-white text-lg font-normal px-6"]
${delete_toast_el}    xpath=//li[@data-sonner-toast]//div[contains(@class,'border-success')]
${delete_toast_txt}    เทมเพลตได้ถูกลบสำเร็จแล้ว

*** Keywords ***
#Keyword of create page
Click Create Template Button
    [Documentation]    Can click create template button
    SeleniumLibrary.Wait Until Element Is Enabled    ${craete_template_bt}
    common.Click Element When Ready    ${craete_template_bt}

Verify Page Display Create Tempale Page
    [Documentation]    The system can display สร้างบรอดแคสต์
    SeleniumLibrary.Wait Until Element Is Enabled    ${craete_template_txt}
    common.Wait Until Element Is Ready For Interaction    ${craete_template_txt}

Input Template Name
    [Documentation]    Input template name
    [Arguments]    ${name}
    ${randome}=    Evaluate    random.randint(1000, 9999)    modules=random
    ${name_randome}=    Set Variable    ${name}${randome}
    common.Input Text To Element When Ready   ${input_tempale_name_elm}    ${name_randome}
    RETURN    ${name_randome}

Input Alert Message
    [Documentation]    Input template name
    [Arguments]    ${messge}
    ${randome_str}=    Evaluate    ''.join(random.choices('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', k=4))    modules=random
    common.Input Text To Element When Ready   ${input_message_elm}     ${messge}${randome_str}

Select Start Date At Current Button
    [Documentation]    Click date picker to selete start date
    common.Click Element When Ready    ${tap_start_date_elm}
    common.Click Element When Ready    ${current_day_elm}

Select End Date At Current Button
    [Documentation]    Click date picker to selete end date
    common.Click Element When Ready    ${tap_end_date_elm}
    common.Click Element When Ready    ${current_day_elm}

Select Start Date At Tomorrow
    [Documentation]    Click date picker to selete start date at tomorrow
    common.Click Element When Ready    ${tap_start_date_elm}
    ${tomorrow_day}=    Get Current Date    result_format=%d    increment=1 days
    ${tomorrow_int}=    Convert To Integer    ${tomorrow_day}
    Click Element    xpath=//td/button[@name="day" and normalize-space(text())="${tomorrow_int}"]

Select Start Time At Current Button
    [Documentation]    Click date picker to selete start time at current time button
    common.Click Element When Ready    ${tap_start_time_elm}
    common.Click Element When Ready    ${current_time_elm}

Select Start Time One Minute Later
    [Documentation]    Select start time at +1 minute from current time (using Python Evaluate)
    # คำนวณเวลา +1 นาที คืนค่าเป็น HH:MM
    ${target}=    Evaluate    ( __import__('datetime').datetime.now() + __import__('datetime').timedelta(minutes=1) ).strftime("%H:%M")    sys
    Log    Target time = ${target}
    ${hm}=    Split String    ${target}    :
    ${hour}=    Set Variable    ${hm[0]}
    ${minute}=  Set Variable    ${hm[1]}
    common.Click Element When Ready    ${tap_start_time_elm}
    ${hour_xpath}=    Set Variable    (//div[contains(@class,'flex flex-col overflow-y-auto p-4 max-h-64 no-scrollbar')])[1]//*[text()='${hour}']
    ${minute_xpath}=  Set Variable    (//div[contains(@class,'flex flex-col overflow-y-auto p-4 max-h-64 no-scrollbar')])[2]//*[text()='${minute}']
    common.Click Element When Ready    ${hour_xpath}
    common.Click Element When Ready    ${minute_xpath}
    common.Click Element When Ready    ${confirm_time_bt}

Select End Time One Minute Later At Start Later Time
    [Documentation]    Select start time at +1 minute from current time (using Python Evaluate)
    # คำนวณเวลา +2 นาที คืนค่าเป็น HH:MM
    ${target}=    Evaluate    ( __import__('datetime').datetime.now() + __import__('datetime').timedelta(minutes=2) ).strftime("%H:%M")    sys
    Log    Target time = ${target}
    ${hm}=    Split String    ${target}    :
    ${hour}=    Set Variable    ${hm[0]}
    ${minute}=  Set Variable    ${hm[1]}
    common.Click Element When Ready    ${tap_end_time_elm}
    ${hour_xpath}=    Set Variable    (//div[contains(@class,'flex flex-col overflow-y-auto p-4 max-h-64 no-scrollbar')])[1]//*[text()='${hour}']
    ${minute_xpath}=  Set Variable    (//div[contains(@class,'flex flex-col overflow-y-auto p-4 max-h-64 no-scrollbar')])[2]//*[text()='${minute}']
    common.Click Element When Ready    ${hour_xpath}
    common.Click Element When Ready    ${minute_xpath}
    common.Click Element When Ready    ${confirm_time_bt}

Select End Date +1 At Start Date
    [Documentation]    Click date picker to selete start date at tomorrow
    common.Click Element When Ready    ${tap_end_date_elm}
    ${end_day}=    Get Current Date    result_format=%d    increment=2 days
    ${end_int}=    Convert To Integer    ${end_day}
    Click Element    xpath=//td/button[@name="day" and normalize-space(text())="${end_int}"]

Select End Date At Tomorrow
    [Documentation]    Click date picker to selete start date at tomorrow
    common.Click Element When Ready    ${tap_end_date_elm}
    ${end_day}=    Get Current Date    result_format=%d    increment=1 days
    ${end_int}=    Convert To Integer    ${end_day}
    Click Element    xpath=//td/button[@name="day" and normalize-space(text())="${end_int}"]

Select End Time At Current Button
    [Documentation]    Click date picker to selete start time at current time button
    common.Click Element When Ready    ${tap_end_time_elm}
    common.Click Element When Ready    ${current_time_elm}

Click Create Message Template Button
    [Documentation]    Click create message template button
    SeleniumLibrary.Scroll Element Into View    ${create_massage_tempalte_bt}
    SeleniumLibrary.Wait Until Element Is Enabled    ${create_massage_tempalte_bt}    ${GLOBAL_CONFIG['TIME_OUT']}
    SeleniumLibrary.Wait Until Element Is Visible    ${create_massage_tempalte_bt}    ${GLOBAL_CONFIG['TIME_OUT']}
    common.Click Element When Ready    ${create_massage_tempalte_bt}

Input Message Template Name
    [Documentation]    Input Message Template Name
    [Arguments]    ${name_message}
    ${randome}=    Evaluate    random.randint(1000, 9999)    modules=random
    common.Input Text To Element When Ready   ${input_message_tempale_name_elm}     ${name_message}${randome}

Click Defualt Tab
    [Documentation]    To click default tab
    common.Click Element When Ready    ${defualt_tab}

Click Custom Tab
    [Documentation]    To click default tab
    common.Click Element When Ready    ${custom_tab}

Click Style1
    [Documentation]    To click style1
    common.Click Element When Ready    ${defualt_tab}

Import Upper Image
    [Documentation]    To import image file
    [Arguments]    ${upper_image_path}
    SeleniumLibrary.Wait Until Element Is Enabled    ${import_image_elm}
    SeleniumLibrary.Choose File    ${import_image_elm}    ${upper_image_path}

Import Lower Image
    [Documentation]    To import image file
    [Arguments]    ${lower_image_path}
    SeleniumLibrary.Wait Until Element Is Enabled    ${import_image_elm}
    SeleniumLibrary.Choose File    ${import_image_elm}    ${lower_image_path}

Input Message Template
    [Documentation]    To input message
    [Arguments]    ${message_input}
    SeleniumLibrary.Scroll Element Into View    ${message_elm}
    common.Input Text To Element When Ready    ${message_elm}    ${message_input}

Selete Color Template
    [Documentation]    To input message
    [Arguments]    ${color_input}
    common.Click Element When Ready    xpath=//div[contains(@style, '${color_input}')]

Click Save Message Template Button
    [Documentation]    Click to save template
    common.Click Element When Ready    ${save_message_template_elm}

Click Save Template Button
    [Documentation]    Click to create template
    SeleniumLibrary.Scroll Element Into View    ${save_template_elm}
    SeleniumLibrary.Wait Until Element Is Visible    ${save_template_elm}
    common.Click Element When Ready    ${save_template_elm}

Verify With Name When Create Tempalte Success
    [Documentation]    Click to save template
    [Arguments]    ${craete_name_validate}
    SeleniumLibrary.Wait Until Element Is Enabled    ${template_list_txt}    ${GLOBAL_CONFIG['TIME_OUT']}
    SeleniumLibrary.Wait Until Element Is Visible    ${template_list_txt}    ${GLOBAL_CONFIG['TIME_OUT']}
    common.Wait Until Element Is Ready For Interaction    ${template_list_txt}
    common.Click Element When Ready    ${side_menu_icon}
    Sleep    2
    SeleniumLibrary.Page Should Contain    ${craete_name_validate}

Click Style2
    [Documentation]    To click style2
    common.Click Element When Ready    ${style2_elm}

Click Style3
    [Documentation]    To click style2
    common.Click Element When Ready    ${style3_elm}

Click Style4
    [Documentation]    To click style2
    common.Click Element When Ready    ${style4_elm}

Click Style5
    [Documentation]    To click style2
    common.Click Element When Ready    ${style5_elm}

Import Left Image
    [Documentation]    To import image file
    [Arguments]    ${upper_image_path}
    SeleniumLibrary.Wait Until Element Is Enabled    ${import_image_elm}
    SeleniumLibrary.Choose File    ${import_image_elm}    ${upper_image_path}

Import Right Image
    [Documentation]    To import image file
    [Arguments]    ${lower_image_path}
    SeleniumLibrary.Wait Until Element Is Enabled    ${import_image_elm}
    SeleniumLibrary.Choose File    ${import_image_elm}    ${lower_image_path}

Input Json Code
    [Documentation]    Input Message Template Name
    [Arguments]    ${json_code}
    ${data}=    JSONLibrary.Load JSON From File    ${json_code}
    ${data_covert}=    JSONLibrary.Convert Json To String    ${data}
    common.Input Text To Element When Ready   ${json_input_elm}     ${data_covert}

#Keyword of list page
Search Name Template
    [Documentation]    Search Name
    [Arguments]    ${search_key}
    common.Input Text To Element When Ready    ${search_key_elm}    ${search_key}
    common.Click Element When Ready    ${seach_bt}

Click More Action
    [Documentation]    Click more action button at all record
    common.Click Element When Ready    ${more_action_bt}

Click Inactive Action Button
    [Documentation]    Click inactive action button for schedule status
    SeleniumLibrary.Wait Until Element Is Enabled    ${inactive_bt01}    ${GLOBAL_CONFIG['TIME_OUT']}
    SeleniumLibrary.Wait Until Element Is Visible    ${inactive_bt01}    ${GLOBAL_CONFIG['TIME_OUT']}
    common.Click Element When Ready    ${inactive_bt01}

Click Publish Action Button
    [Documentation]    Click inactive action button for schedule status
    SeleniumLibrary.Wait Until Element Is Enabled    ${publish_bt}    ${GLOBAL_CONFIG['TIME_OUT']}
    SeleniumLibrary.Wait Until Element Is Visible    ${publish_bt}    ${GLOBAL_CONFIG['TIME_OUT']}
    common.Click Element When Ready    ${publish_bt}

Click Inactive Action Button For Active Status Record
    [Documentation]    Click inactive action button for active status
    SeleniumLibrary.Wait Until Element Is Enabled    ${inactive_bt02}    ${GLOBAL_CONFIG['TIME_OUT']}
    SeleniumLibrary.Wait Until Element Is Visible    ${inactive_bt02}    ${GLOBAL_CONFIG['TIME_OUT']}
    common.Click Element When Ready    ${inactive_bt02}

Verify Modal Confirm To Inactive
    [Documentation]    Verify modal have contain
    SeleniumLibrary.Page Should Contain    ${template_module['inactive_alert_message']}

Click Confirm To Inactive Button
    [Documentation]    Click to inactive confirm
    common.Click Element When Ready    ${confirm_inactive_bt}

Verify Status After Inactive Success
    [Documentation]    Verify the template have contain
    SeleniumLibrary.Page Should Contain    ${template_module['inactive_status']}

Verify Status After Active Success
    [Documentation]    Verify the template have contain
    SeleniumLibrary.Page Should Contain    ${template_module['active_status']}

Verify Status After Expired Success
    [Documentation]    Verify the template have contain
    SeleniumLibrary.Page Should Contain    ${template_module['expired_status']}

Click Status Dropdown
    [Documentation]    Click dropdown status
    common.Click Element When Ready    ${dropdown_status_bt}

Select Status From Status Dropdown List
    [Documentation]    Click to select status
    [Arguments]    ${status_select}
    Execute Javascript    const el = document.querySelector("select"); el.value = "${status_select}";
    Execute Javascript    document.querySelector("select").dispatchEvent(new Event("change", { bubbles:true }));
    common.Click Element When Ready    ${seach_bt}

Click Edit Button On More Action
    [Documentation]    Click edit button
    common.Click Element When Ready    ${edit_bt}

Get More Action Button Form Template
    [Documentation]    Get value form xpath to validate all button when template is active status
    common.Wait Until Element Is Ready For Interaction    ${more_action_el}
    ${action_list}=    Create List
    @{action_value_el}=    Get WebElements    ${more_action_el}
    FOR    ${el}    IN    @{action_value_el}
    ${action_txt}=    Get Text    ${el}
    Append To List    ${action_list}    ${action_txt}
    END
    RETURN    ${action_list}

Verify Value Of More Action Should Not Have Button
    [Documentation]    The action button should NOT have invalid value (ปิดใช้งาน,แก้ไข,ลบ)
    [Arguments]    ${invalid_action}    @{action_list}
    FOR    ${item}    IN    @{action_list}
        List Should Not Contain Value
        ...    ${invalid_action}
        ...    ${item}
        ...    msg=Validation FAILED! Found invalid status: '${item}'
        Log    '${item}' is a valid status.
    END

Click View Detail Icon
    [Documentation]    Click view icon to view page
    SeleniumLibrary.Wait Until Element Is Enabled    ${view_detail}    ${GLOBAL_CONFIG['TIME_OUT']}
    SeleniumLibrary.Wait Until Element Is Visible    ${view_detail}    ${GLOBAL_CONFIG['TIME_OUT']}
    common.Click Element When Ready    ${view_detail}

Click Delete Schedule Template
    [Documentation]    Click delete icon to delete schedule item
    SeleniumLibrary.Wait Until Element Is Enabled    ${delete_shcedule_bt}    ${GLOBAL_CONFIG['TIME_OUT']}
    SeleniumLibrary.Wait Until Element Is Visible    ${delete_shcedule_bt}    ${GLOBAL_CONFIG['TIME_OUT']}
    common.Click Element When Ready    ${delete_shcedule_bt}
    common.Click Element When Ready    ${confirm_delete_bt}

Click Delete Expired Template
    [Documentation]    Click delete icon to delete expired item
    SeleniumLibrary.Wait Until Element Is Enabled    ${delete_expired_bt}    ${GLOBAL_CONFIG['TIME_OUT']}
    SeleniumLibrary.Wait Until Element Is Visible    ${delete_expired_bt}    ${GLOBAL_CONFIG['TIME_OUT']}
    common.Click Element When Ready    ${delete_expired_bt}
    common.Click Element When Ready    ${confirm_delete_bt}

Verify Delete Success Toast
    [Documentation]    Verify delete success toast
    SeleniumLibrary.Wait Until Element Is Enabled    ${delete_toast_el}    ${GLOBAL_CONFIG['TIME_OUT']}
    SeleniumLibrary.Wait Until Element Is Visible    ${delete_toast_el}    ${GLOBAL_CONFIG['TIME_OUT']}
    common.Wait Until Element Is Ready For Interaction    ${delete_toast_el}
    SeleniumLibrary.Page Should Contain    ${delete_toast_txt}

#keyword of edit page
Verify Edit Page Should Have Contain
    [Documentation]    Verify contain at edit page
    SeleniumLibrary.Wait Until Element Is Enabled    ${input_tempale_name_elm}    ${GLOBAL_CONFIG['TIME_OUT']}
    SeleniumLibrary.Wait Until Element Is Visible    ${input_tempale_name_elm}    ${GLOBAL_CONFIG['TIME_OUT']}
    SeleniumLibrary.Page Should Contain    ${template_module['edit_page']}

Clear Template Name
    [Documentation]    Clear data on template name
    common.Input Text To Element When Ready   ${input_tempale_name_elm}   ${EMPTY}

Clear Alert Message
    [Documentation]    Clear data on alert message
    common.Input Text To Element When Ready   ${input_message_elm}   ${EMPTY}

Edit Start Date At Current Button
    [Documentation]    Click date picker to selete start date
    SeleniumLibrary.Scroll Element Into View    ${start_date_el}
    common.Click Element When Ready    ${start_date_el}
    common.Click Element When Ready    ${current_day_elm}

Click Edit Template Message Icon
    [Documentation]    Click to edit tempale at fist record
    SeleniumLibrary.Scroll Element Into View    ${edit_icon_first}
    common.Click Element When Ready    ${edit_icon_first}

Edit Message Template Name
    [Documentation]    Edit Message Template Name
    [Arguments]    ${name_message_edit}
    common.Input Text To Element When Ready   ${input_message_tempale_name_elm}   ${EMPTY}
    ${randome}=    Evaluate    random.randint(1000, 9999)    modules=random
    common.Input Text To Element When Ready   ${input_message_tempale_name_elm}     ${name_message_edit}${randome}

Verify With Name When Edit Tempalte Success
    [Documentation]    Click to save template
    [Arguments]    ${edit_name_validate}
    common.Click Element When Ready    ${side_menu_icon}
    SeleniumLibrary.Page Should Contain    ${edit_name_validate}

Verify Edit Button On View Page Should Not Have
    [Documentation]    Should not have the edit button on view page
    SeleniumLibrary.Page Should Not Contain Element    ${edit_button_view_page}