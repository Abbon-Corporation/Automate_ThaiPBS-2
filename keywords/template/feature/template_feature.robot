*** Settings ***
Resource    ${CURDIR}/../../../resources/import.robot

*** Keywords ***
Click create template button to create page
    [Documentation]    Can go to create tenplate
    template_page.Click Create Template Button
    template_page.Verify Page Display Create Tempale Page

Input Detail Tempale At Schedule Date And Time
    [Documentation]    Input all data to create tempale
    [Arguments]    ${name}    ${messge}
    ${name_validate}=    template_page.Input Template Name    ${name}
    template_page.Input Alert Message    ${messge}
    template_page.Select Start Date At Tomorrow
    template_page.Select Start Time At Current Button
    template_page.Select End Date +1 At Start Date
    template_page.Select End Time At Current Button
    RETURN    ${name_validate}

Create Template Style1
    [Documentation]    Create Template Style1
    [Arguments]    ${name_message}    ${upper_image_path}    ${lower_image_path}    ${message_input}    ${color_input}    ${name_validate}
    template_page.Click Create Message Template Button
    template_page.Input Message Template Name    ${name_message}
    #template_page.Click Defualt Tab
    #template_page.Click Style1
    template_page.Import Upper Image    ${upper_image_path}
    template_page.Import Lower Image    ${lower_image_path}
    template_page.Input Message Template    ${message_input}
    template_page.Selete Color Template    ${color_input}
    template_page.Click Save Message Template Button
    Sleep    5
    template_page.Click Save Template Button
    Sleep    5
    template_page.Verify With Name When Create Tempalte Success    ${name_validate}