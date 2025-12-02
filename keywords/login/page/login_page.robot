*** Settings ***
Resource    ${CURDIR}/../../../resources/import.robot

*** Variables ***
${login_title_login_txt}    xpath=//*[text()="${login_page['login_title']}"]
${email_login_input}    xpath=//*[@placeholder="รหัสพนักงาน"]
${password_login_input}    xpath=//*[@name="password"]
${signin_login_button}    xpath=//*[@type="submit"]

*** Keywords ***
Current Page Should Be Login Page
    [Documentation]    Verify login page title should be display
    common.Wait Until Element Is Ready For Interaction    ${login_title_login_txt}

Input Email
    [Documentation]    Input email on field
    [Arguments]    ${email}
    common.Input Text To Element When Ready    ${email_login_input}    ${email}

Input Password
    [Documentation]    Input password on field
    [Arguments]    ${password}
    common.Input Text To Element When Ready    ${password_login_input}    ${password}

Click Sign In Button
    [Documentation]    Tap sign in button for login
    common.Click Element When Ready    ${signin_login_button}