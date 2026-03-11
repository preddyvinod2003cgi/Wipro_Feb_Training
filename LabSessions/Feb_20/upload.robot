*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${url}    https://www.tutorialspoint.com/selenium/practice/upload-download.php
${file_to_upload}    C://state1.txt

*** Test Cases ***
Upload File On Tutorialspoint
    Open Browser    ${url}    chrome
    # maximize the browser window
    Maximize Browser Window
    Sleep    2s
    # scroll to upload section
    Execute JavaScript    window.scrollBy(0,600)
    Sleep    1s
    # make upload input visible
    Execute JavaScript    document.getElementById('uploadfile_0').style.display='block';
    Sleep    1s
    # choose the file to upload
    Choose File    xpath://input[@id='uploadfile_0']    ${file_to_upload}
    Sleep    1s
    # click the upload button
    Click Element    xpath://input[@id='submitbutton']
    Sleep    2s
    # close browser
    Close Browser