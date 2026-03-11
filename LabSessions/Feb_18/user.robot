#Create dictionary &{USER} and print one key value
*** Variables ***
&{USER}    username=admin    password=admin123

*** Test Cases ***
Print Dictionary Value
    Log    ${USER}[username]



