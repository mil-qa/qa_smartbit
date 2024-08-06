*** Settings ***
Documentation                AIO resources

Resource             database.resource
Resource             services/sessions.resource
Resource             services/students.resource
Resource             pages/login.resource
Resource             pages/enroll.resource
Resource             components/nav_bar.resource
Resource             components/toaster.resource
Resource             components/notification.resource
Library              JSONLibrary

*** Keywords ***
# * Helpers
Do Login
    [Arguments]                 ${user}
    Go To Login Page
    Fill credentials            ${user}[email]    ${user}[password]
    Submit credentials
    User Should Be Logged In    ${user}[name]

Get Fixture
    [Arguments]       ${fixture_file}

    ${fixture}        Load Json From File    
    ...               ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...               encoding=UTF-8
    
    RETURN            ${fixture}