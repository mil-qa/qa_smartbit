*** Settings ***
Documentation                AIO resources

Resource             pages/login.resource
Resource             pages/enroll.resource
Resource             components/nav_bar.resource
Resource             components/toaster.resource

*** Keywords ***
# * Helpers
Do Login
    [Arguments]                 ${user}
    Go To Login Page
    Fill credentials            ${user}[email]    ${user}[password]
    Submit credentials
    User Should Be Logged In    ${user}[name]