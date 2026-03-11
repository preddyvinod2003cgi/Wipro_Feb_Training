*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Verify login with valid credentials
    Log    Enter username
    Log    Enter password
    Log    click on login button
    Log    user is on the home page
