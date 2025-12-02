*** Settings ***
Resource    ${CURDIR}/../../../resources/import.robot

*** Keywords ***
Verify Page Display Home Component
    [Documentation]    Current page should be dispaly home component as expected
    home_page.Verify Page Display ThaiPBS Title
    home_page.Verify Page Display Message Management Module

Tap Main Menu And Submenu
    [Documentation]    Click on main menu after that click on submenu
    [Arguments]    ${main_menu}    ${sub_menu}
    home_page.Tap Main Menu By Name    ${main_menu}
    home_page.Tap Submenu By Main Menu    ${main_menu}    ${sub_menu}