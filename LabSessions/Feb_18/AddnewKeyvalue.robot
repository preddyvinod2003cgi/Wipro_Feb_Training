*** Settings ***
Library    Collections

*** Variables ***
&{USER}    username=admin    password=admin123

*** Test Cases ***
Add New Key To Dictionary
    Set To Dictionary    ${USER}    email=admin@gmail.com
    Log    ${USER}

