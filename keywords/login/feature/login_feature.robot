*** Settings ***
Resource    ${CURDIR}/../../../resources/import.robot

*** Keywords ***
Input Email Password And Sign In To Login
    [Documentation]    Login into heygoody
    [Arguments]    ${email}    ${password}
    login_page.Current Page Should Be Login Page
    login_page.Input Email    ${email}
    login_page.Input Password    ${password}
    login_page.Click Sign In Button
