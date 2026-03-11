*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${url}    https://the-internet.herokuapp.com/upload

*** Test Cases ***
Verify radio buttons
    Open Browser    ${url}    chrome
    # maximize the browser window
    Maximize Browser Window
    # wait till the element is loaded
    Sleep    3s
    Wait Until Element Is Visible    xpath://input[@id='file-upload']
    Choose File    xpath://input[@id='file-upload']    C://state1.txt
    # click the upload button
    Click Element    xpath://input[@id='file-submit']
    Sleep    2s
    Element Text Should Be    xpath://h3[normalize-space()='File Uploaded!']    File Uploaded!
    Sleep    2s
    # close browser
    Close Browser