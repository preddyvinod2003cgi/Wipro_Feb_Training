*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
# name of the testcase
Verify login with valid credentials
    Login

Verify Add to cart functionality
    Login
    Log    User selects the product
    Log    User adds the product to the cart
    Log    User verifies that the product with details is added to the cart


*** Keywords ***
Login
    Log    Enter username
    Log    Enter password
    Log    click on login button
    Log    user is on the home page
