*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    OperatingSystem
Library    String
Library    Collections
Library    DateTime
Library    JSONLibrary
Library    ${CURDIR}/custom_library/env_loader.py

Variables    ${CURDIR}/config.yaml
Variables    ${CURDIR}/datatest/translation_en.yaml
Variables    ${CURDIR}/datatest/translation_th.yaml
Variables    ${CURDIR}/datatest/testdata.yaml

#common
Resource    ${CURDIR}/../keywords/common.robot

#page keyword
Resource    ${CURDIR}/../keywords/login/page/login_page.robot
Resource    ${CURDIR}/../keywords/home/page/home_page.robot
Resource    ${CURDIR}/../keywords/template/page/template_page.robot

#feature keyword
Resource    ${CURDIR}/../keywords/login/feature/login_feature.robot
Resource    ${CURDIR}/../keywords/home/feature/home_feature.robot
Resource    ${CURDIR}/../keywords/template/feature/template_feature.robot

*** Variables ***
${IS_CICD}    %{IS_CICD=false}
