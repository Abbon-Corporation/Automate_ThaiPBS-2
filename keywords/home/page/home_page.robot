*** Settings ***
Resource    ${CURDIR}/../../../resources/import.robot

*** Variables ***
${thaip_title_home_txt}    xpath=//div[contains(text(),"${home_page['thaip_title']}")]
${message_menu_home_txt}    xpath=//*[text()="${home_page['message']}"]
${tempalte_module_menu_home_txt}    xpath=//*[text()="${home_page['template_module']}"]
${main_menu_home_button}    xpath=//*[text()="{{main_menu}}"]
${submenu_home_button}    xpath=//*[text()="{{main_menu}}"]/ancestor::div//span[text()="{{sub_menu}}"]

*** Keywords ***
Verify Page Display ThaiPBS Title
    [Documentation]  Current page should be display thai PBS title
    common.Wait Until Element Is Ready For Interaction    ${thaip_title_home_txt}

Verify Page Display Message Management Module
    [Documentation]  Current page should be display travel menu
    common.Wait Until Element Is Ready For Interaction    ${message_menu_home_txt}

Verify Page Display template Module
    [Documentation]  Current page should be display discount module menu
    common.Wait Until Element Is Ready For Interaction    ${tempalte_module_menu_home_txt}

Tap Main Menu By Name
    [Documentation]    Tap main menu at side menu
    [Arguments]    ${menu_name}
    ${menu}    String.Replace String    ${main_menu_home_button}    {{main_menu}}    ${menu_name}
    common.Click Element When Ready    ${menu}

Tap Submenu By Main Menu
    [Documentation]    Tap submenu at side menu
    [Arguments]    ${main_menu}    ${sub_menu}
    ${main_menu}    String.Replace String    ${submenu_home_button}    {{main_menu}}    ${main_menu}
    ${sub_menu}    String.Replace String    ${main_menu}    {{sub_menu}}    ${sub_menu}
    common.Click Element When Ready    ${sub_menu}