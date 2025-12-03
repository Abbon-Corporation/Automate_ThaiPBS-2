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
${create_massage_tempalte_bt}    xpath=//button[contains(.,'สร้างข้อความอวยพร')]
${input_message_tempale_name_elm}    xpath=//input[@name="name"]
${defualt_tab}    xpath=//button[contains(.,'Defualt')]
${custom_tab}    xpath=//button[contains(.,'Custom')]
${style1_elm}    xpath=//*[@class="flex flex-col items-center justify-between gap-2 border w-[94px] min-h-[120px] rounded-lg transition-all duration-200 ease-in-out p-2 hover:-translate-y-1 hover:cursor-pointer border-border bg-white"][1]
${style2_elm}    xpath=//*[@class="flex flex-col items-center justify-between gap-2 border w-[94px] min-h-[120px] rounded-lg transition-all duration-200 ease-in-out p-2 hover:-translate-y-1 hover:cursor-pointer border-border bg-white"][2]
${style3_elm}    xpath=//*[@class="flex flex-col items-center justify-between gap-2 border w-[94px] min-h-[120px] rounded-lg transition-all duration-200 ease-in-out p-2 hover:-translate-y-1 hover:cursor-pointer border-primary bg-brand-50"]
${style4_elm}    xpath=//*[@class="flex flex-col items-center justify-between gap-2 border w-[94px] min-h-[120px] rounded-lg transition-all duration-200 ease-in-out p-2 hover:-translate-y-1 hover:cursor-pointer border-border bg-white"][3]
${style5_elm}    xpath=//*[@class="flex flex-col items-center justify-between gap-2 border w-[94px] min-h-[120px] rounded-lg transition-all duration-200 ease-in-out p-2 hover:-translate-y-1 hover:cursor-pointer border-border bg-white"][4]
${import_image_elm}    xpath=//input[@accept="image/jpeg,.jpg,.jpeg,image/png,.png"]
${save_message_template_elm}    xpath=(//button[@type='submit'])[2]
${message_elm}    xpath=//*[@placeholder="Greeting"]
${save_template_elm}    xpath=//button[text()="บันทึก"]
${name_template_elm}    xpath=//tr[1]//span[@class='line-clamp-1 cursor-pointer hover:underline hover:text-brand']
${json_input_elm}    xpath=//*[@placeholder="field.flex_message.custom.json_code"]

*** Keywords ***
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

Select End Date +1 At Start Date
    [Documentation]    Click date picker to selete start date at tomorrow
    common.Click Element When Ready    ${tap_end_date_elm}
    ${end_day}=    Get Current Date    result_format=%d    increment=2 days
    ${end_int}=    Convert To Integer    ${end_day}
    Click Element    xpath=//td/button[@name="day" and normalize-space(text())="${end_int}"]

Select End Time At Current Button
    [Documentation]    Click date picker to selete start time at current time button
    common.Click Element When Ready    ${tap_end_time_elm}
    common.Click Element When Ready    ${current_time_elm}

Click Create Message Template Button
    [Documentation]    Click create message template button
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
    #[Arguments]    ${craete_name}
    #${template_name}=    Get Text    ${name_template_elm}
    #Should Be Equal    ${template_name}    ${craete_name}
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