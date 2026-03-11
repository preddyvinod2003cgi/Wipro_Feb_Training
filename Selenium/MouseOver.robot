*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
*** Variables ***
${url}    https://the-internet.herokuapp.com/hovers

*** Test Cases ***
Verify radio buttons
    Open Browser    ${url}    firefox
    # maximize the browser window
    Maximize Browser Window
    # wait till the element is loaded
    Sleep    3s
    Wait Until Element Is Visible    xpath://div[@class='example']//div[1]//img[1]
    Mouse Over    xpath://div[@class='example']//div[1]//img[1]
    Sleep    2s
    Element Should Be Visible    xpath://h5[contains(text(),'name: user1')]
    # close browser
    Close Browser