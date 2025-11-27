*** Settings ***
#Offical Library
Library    SeleniumLibrary
Library    String
Library    Collections

#Custom Library
Library    ${CURDIR}/custom_library/env_loader.py

#Translation
Variables    ${CURDIR}/datatest/translation_${LANG}.yaml

#Test data
Variables    ${CURDIR}/datatest/testdata.yaml

#Feature


#Keywords
#Common keywords

#Page keywords


#config
Variables    ${CURDIR}/config.yaml
*** Variables ***
${IS_CICD}    false