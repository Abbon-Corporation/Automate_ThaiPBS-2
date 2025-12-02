
*** Settings ***
Resource    ${CURDIR}/../resources/import.robot

*** Keywords ***
Close Browser And Capture Log
    [Documentation]    Close website and run keyword for tear down
    BuiltIn.Run keyword and ignore error    SeleniumLibrary.Capture page screenshot    ${TEST_NAME.replace(' ','_').lower()}.png
    BuiltIn.Run keyword if test failed    Run keyword and ignore error    SeleniumLibrary.Log source
    BuiltIn.Run keyword and ignore error    SeleniumLibrary.Close all browsers

Click Element When Ready
    [Documentation]     Keyword to wait for element to be visible before clicking.
    ...     \n default retry clicking is 3 times
    ...     \n can also wait for only page is CONTAINS element instead of visible
    [Arguments]    ${locator}    ${retry}=3    ${only_contains}=${FALSE}    ${timeout}=${GLOBAL_CONFIG.TIME_OUT}
    FOR    ${i}    IN RANGE    1    ${retry}
        IF  ${only_contains}
            ${wait_status}=    Run keyword and ignore error    common.Wait Until Element Is Ready For Interaction    ${locator}    ${timeout}
            ${err_msg_wait}=    BuiltIn.Convert to string    ${wait_status[1]}
            ${is_not_stale_wait}=    Run keyword and return status    BuiltIn.Should not contain    ${err_msg_wait}    StaleElementReferenceException
        ELSE
            ${wait_status}=    Run keyword and ignore error    common.Wait Until Element Is Ready For Interaction    ${locator}    ${timeout}
            ${err_msg_wait}=    BuiltIn.Convert to string    ${wait_status[1]}
            ${is_not_stale_wait}=    Run keyword and return status    BuiltIn.Should not contain    ${err_msg_wait}    StaleElementReferenceException
        END
        ${is_success}=    Run keyword and ignore error    SeleniumLibrary.Click element    ${locator}
        ${err_msg}=    BuiltIn.Convert to string    ${is_success[1]}
        ${is_obsecure}=    Run keyword and return status    BuiltIn.Should not contain    ${err_msg}    Other element would receive the click
        ${is_not_stale}=    Run keyword and return status    BuiltIn.Should not contain    ${err_msg}    StaleElementReferenceException
        ${is_no_err}=    Run keyword and return status    BuiltIn.Should be true    '${err_msg}' == '${NONE}'
        ${is_empty_wait}=    Run keyword and return status    BuiltIn.Should be true    '${err_msg_wait}' == '${NONE}'
        ${result}=    BuiltIn.Evaluate    ${is_success} and ${is_not_stale_wait} and ${is_obsecure} and ${is_not_stale} and ${is_no_err} and ${is_empty_wait}
        Exit for loop if    ${result}
        BuiltIn.Log    'retry clicking element for ${i} time with error: ${err_msg}, '${err_msg_wait}'
    END
    BuiltIn.Should be true    ${result}    msg="Failed to click element after ${retry} retry"

Input Text To Element When Ready
    [Documentation]     Wait for element to be visible first before input text. Retry 3 times
    [Arguments]    ${locator}    ${text}    ${clear}=${TRUE}    ${timeout}=${GLOBAL_CONFIG.TIME_OUT}
    common.Wait Until Element Is Ready For Interaction    ${locator}    ${timeout}
    FOR    ${index}    IN RANGE    1    3
        ${result_msg}=    Run keyword and ignore error    SeleniumLibrary.Input Text    ${locator}    ${text}    clear=${clear}
        ${err_msg}=    BuiltIn.Convert to string    ${result_msg[1]}
        ${is_success}=    Run keyword and return status    BuiltIn.Should Be Equal    ${err_msg}    None
        ${is_not_loading_error}=    Run keyword and return status    BuiltIn.Should not contain    ${err_msg}    invalid element state
        Exit For Loop If    ${is_success} or ${is_not_loading_error}
    END
    BuiltIn.Should Be True    ${is_success}    msg=Unable to input text to element after 4 retry

Get Text From Element When Ready
    [Documentation]     Wait until element is visible first before get text from element.
                        ...     \n default timeout is same as ${GLOBAL_TIMEOUT}
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_CONFIG.TIME_OUT}
    common.Wait Until Element Is Ready For Interaction    ${locator}    ${timeout}
    ${text}=    SeleniumLibrary.Get text    ${locator}
    RETURN    ${text}

Get Attribute Value When Ready
    [Documentation]   Get attribute value when ready on web
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_CONFIG.TIME_OUT}    ${attribute}=value
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    ${value}=   SeleniumLibrary.Get element attribute    ${locator}    ${attribute}
    RETURN    ${value}

Get Element Count When Ready
    [Documentation]   Get element count when ready on web
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_CONFIG.TIME_OUT}
    ${exist}=    BuiltIn.Run keyword and return status    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    ${value}=    SeleniumLibrary.Get element count    ${locator}
    RETURN    ${value}

Open Browser And Navigate To URL
    [Documentation]    Opens a browser and navigates to the specified URL
    [Arguments]    ${url}    ${browser}=chrome    ${screen_width}=${DEFAULT_SCREEN_SIZE.WIDTH}    ${screen_height}=${DEFAULT_SCREEN_SIZE.HEIGHT}
    IF    '${IS_CICD.lower()}' == 'true'
        IF    '${browser.lower()}' == 'chrome'
            ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
            BuiltIn.Call Method    ${chrome_options}    add_argument    --headless
            BuiltIn.Call Method    ${chrome_options}    add_argument    --no-sandbox
            BuiltIn.Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
            BuiltIn.Call Method    ${chrome_options}    add_argument    --disable-gpu
        END
        SeleniumLibrary.Create Webdriver    Chrome    options=${chrome_options}
        SeleniumLibrary.Set Window Size    ${screen_width}    ${screen_height}
        SeleniumLibrary.Go To    ${url}
    ELSE
        SeleniumLibrary.Open Browser    ${url}    ${browser}
        SeleniumLibrary.Maximize Browser Window
    END

Wait Until Element Is Ready For Interaction
    [Documentation]    Waits until the specified element is visible, enabled, and ready for interaction within the given timeout.
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_CONFIG.TIME_OUT}
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}    timeout=${timeout}
    SeleniumLibrary.Wait Until Element Is Visible       ${locator}    timeout=${timeout}

Select Checkbox When Ready
    [Documentation]    Wait until checkbox show on screen and select
    [Arguments]    ${locator}
    common.Wait Until Element Is Ready For Interaction    ${locator}
    SeleniumLibrary.Select Checkbox     ${locator}

Verify List Sort By ASC
    [Documentation]    Input list to verify list sort by asc
    [Arguments]    ${list}
    ${sorted}    BuiltIn.Evaluate    sorted(${list})
    BuiltIn.Should Be Equal    ${list}    ${sorted}

Verify List Sort By DESC
    [Documentation]    Input list to verify list sort by desc
    [Arguments]    ${list}
    ${sorted}    BuiltIn.Evaluate    sorted(${list}, reverse=True)
    BuiltIn.Should Be Equal    ${list}    ${sorted}

Press Enter By Keyboard
    [Documentation]    Press enter by physical keyboard
    SeleniumLibrary.Press Keys    None    ENTER