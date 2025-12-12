*** Settings ***
Resource    ${CURDIR}/../../../resources/import.robot

*** Keywords ***
Click create template button to create page
    [Documentation]    Can go to create tenplate
    template_page.Click Create Template Button
    template_page.Verify Page Display Create Tempale Page

Input Detail Tempale At Schedule Date And Time
    [Documentation]    Input all data to create tempale at schedule date&time
    [Arguments]    ${nam01}    ${messge01}
    ${name_validate01}=    template_page.Input Template Name    ${nam01}
    template_page.Input Alert Message    ${messge01}
    template_page.Select Start Date At Tomorrow
    template_page.Select Start Time At Current Button
    template_page.Select End Date +1 At Start Date
    template_page.Select End Time At Current Button
    RETURN   ${name_validate01}

Input Detail Tempale At Current Date And Time
    [Documentation]    Input all data to create tempale at current date&time
    [Arguments]    ${name02}    ${messge02}
    ${name_validate02}=    template_page.Input Template Name    ${name02}
    template_page.Input Alert Message    ${messge02}
    template_page.Select Start Date At Current Button
    template_page.Select Start Time At Current Button
    template_page.Select End Date At Tomorrow
    template_page.Select End Time At Current Button
    RETURN   ${name_validate02}

Input Detail Tempale At Schedule Date And Time To Expired 1 Min
    [Documentation]    Input all data to create tempale at schedule date and time to expired 1 min
    [Arguments]    ${name03}    ${messge03}
    ${name_validate03}=    template_page.Input Template Name    ${name03}
    template_page.Input Alert Message    ${messge03}
    template_page.Select Start Date At Current Button
    template_page.Select Start Time One Minute Later
    template_page.Select End Date At Current Button
    template_page.Select End Time One Minute Later At Start Later Time
    RETURN   ${name_validate03}

Create Template Style1
    [Documentation]    Create Template Style1
    [Arguments]    ${name_message01}    ${upper_image_path01}    ${lower_image_path01}    ${message_input01}    ${color_input01}
    template_page.Click Create Message Template Button
    template_page.Input Message Template Name    ${name_message01}
    #template_page.Click Defualt Tab
    #template_page.Click Style1
    template_page.Import Upper Image    ${upper_image_path01}
    template_page.Import Lower Image    ${lower_image_path01}
    template_page.Input Message Template    ${message_input01}
    template_page.Selete Color Template    ${color_input01}
    template_page.Click Save Message Template Button

Create Template Style2
    [Documentation]    Create Template Style2
    [Arguments]    ${name_message02}    ${upper_image_path02}    ${lower_image_path02}    ${message_input02}    ${color_input02}
    template_page.Click Create Message Template Button
    template_page.Input Message Template Name    ${name_message02}
    #template_page.Click Defualt Tab
    template_page.Click Style2
    template_page.Import Upper Image    ${upper_image_path02}
    template_page.Import Lower Image    ${lower_image_path02}
    template_page.Input Message Template    ${message_input02}
    template_page.Selete Color Template    ${color_input02}
    template_page.Click Save Message Template Button

Create Template Style3
    [Documentation]    Create Template Style2
    [Arguments]    ${name_message03}    ${left_image_path03}    ${right_image_path03}    ${message_input03}    ${color_input03}
    template_page.Click Create Message Template Button
    template_page.Input Message Template Name    ${name_message03}
    #template_page.Click Defualt Tab
    template_page.Click Style3
    template_page.Import Left Image    ${left_image_path03}
    template_page.Import Right Image    ${right_image_path03}
    template_page.Input Message Template    ${message_input03}
    template_page.Selete Color Template    ${color_input03}
    template_page.Click Save Message Template Button

Create Template Style4
    [Documentation]    Create Template Style2
    [Arguments]    ${name_message04}    ${left_image_path04}    ${right_image_path04}    ${message_input04}    ${color_input04}
    template_page.Click Create Message Template Button
    template_page.Input Message Template Name    ${name_message04}
    #template_page.Click Defualt Tab
    template_page.Click Style4
    template_page.Import Left Image    ${left_image_path04}
    template_page.Import Right Image    ${right_image_path04}
    template_page.Input Message Template    ${message_input04}
    template_page.Selete Color Template    ${color_input04}
    template_page.Click Save Message Template Button

Create Template Style5
    [Documentation]    Create Template Style2
    [Arguments]    ${name_message05}    ${left_image_path05}    ${right_image_path05}    ${lower_image_path05}    ${message_input05}    ${color_input05}
    template_page.Click Create Message Template Button
    template_page.Input Message Template Name    ${name_message05}
    #template_page.Click Defualt Tab
    template_page.Click Style5
    template_page.Import Left Image    ${left_image_path05}
    template_page.Import Right Image    ${right_image_path05}
    template_page.Import Lower Image    ${lower_image_path05}
    template_page.Input Message Template    ${message_input05}
    template_page.Selete Color Template    ${color_input05}
    template_page.Click Save Message Template Button

Create Template Custom
    [Documentation]    Create Template Custom
    [Arguments]    ${name_message}    ${json_code_to_input}
    template_page.Click Create Message Template Button
    template_page.Input Message Template Name    ${name_message}
    template_page.Click Custom Tab
    template_page.Input Json Code    ${json_code_to_input}
    template_page.Click Save Message Template Button

Seach And Inactive Template
    [Documentation]    Seach by name after that can inactive success
    [Arguments]    ${search_input}
    template_page.Search Name Template    ${search_input}
    template_page.Click More Action
    template_page.Click Inactive Action Button
    template_page.Verify Modal Confirm To Inactive
    template_page.Click Confirm To Inactive Button
    template_page.Verify Status After Inactive Success

Seach And Wait For Expired Template
    [Documentation]    Seach by name after that the template update to expired status
    [Arguments]    ${search_key}
    template_page.Search Name Template    ${search_key}
    template_page.Verify Status After Expired Success

Filter At Status And Click To Edit Page
    [Documentation]    Filter at status and go to edit page
    [Arguments]    ${status_to_select}    ${custon_type_name}
    template_page.Select Status From Status Dropdown List    ${status_to_select}
    template_page.Search Name Template    ${custon_type_name}
    template_page.Click More Action
    template_page.Click Edit Button On More Action
    template_page.Verify Edit Page Should Have Contain

Clear Detail Tempale
    [Documentation]    Clear name and alert message
    template_page.Clear Template Name
    template_page.Clear Alert Message

Edit Detail Tempale At Current Date And Time
    [Documentation]    Input all data to create tempale at current date&time
    [Arguments]    ${name04}    ${messge04}
    ${name_validate02}=    template_page.Input Template Name    ${name04}
    template_page.Input Alert Message    ${messge04}
    template_page.Edit Start Date At Current Button
    template_page.Select Start Time At Current Button
    template_page.Select End Date At Tomorrow
    template_page.Select End Time At Current Button
    RETURN   ${name_validate02}

Edit Template Message CustomType To DefualtType
    [Documentation]    Edit template custom type to default type
    [Arguments]    ${edit_name_message06}    ${upper_image_path06}    ${lower_image_path06}    ${message_input06}    ${color_input06}
    template_page.Click Edit Template Message Icon
    template_page.Edit Message Template Name    ${edit_name_message06}
    template_page.Click Defualt Tab
    template_page.Import Upper Image    ${upper_image_path06}
    template_page.Import Lower Image    ${lower_image_path06}
    template_page.Input Message Template    ${message_input06}
    template_page.Selete Color Template    ${color_input06}
    template_page.Click Save Message Template Button

Edit Template Message DefualtType To CustomType
    [Documentation]    Edit template default type to custom type
    [Arguments]    ${edit_name_message07}    ${json_code_to_input}
    template_page.Click Edit Template Message Icon
    template_page.Edit Message Template Name    ${edit_name_message07}
    template_page.Click Custom Tab
    template_page.Input Json Code    ${json_code_to_input}
    template_page.Click Save Message Template Button