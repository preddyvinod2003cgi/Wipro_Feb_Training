*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${url}    https://www.amazon.in/

*** Test Cases ***
Verify link texts
    Open Browser    ${url}    chrome
    # maximize the browser window
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

    @{links}=    Get WebElements    xpath://a
    FOR    ${link}    IN    @{links}
        ${text}=    Get Text    ${link}
        ${url}=     Get Element Attribute    ${link}    href
        Log To Console    ${text}
        Log To Console    ${url}
    END

    # close browser
    Close Browser