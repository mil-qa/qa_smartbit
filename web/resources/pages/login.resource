*** Settings ***
Library    Browser

*** Keywords ***
Go To Login Page
    #* pass -v BROWSER:thebrowseryouwannatest as an argument on the terminal
    # New Browser          headless=False         browser=${BROWSER}
    New Browser          headless=False         browser=chromium
    New Page             http://localhost:3000/
    Set Viewport Size    1280                   720

Fill credentials
    [Arguments]      ${email}    ${pass}
    Fill Text        xpath=//input[@name='email']    ${email}
    Fill Text        css=input[id=password]          ${pass}

Submit credentials
    Click               css=button >> text=Entrar no sistema
    
Field Type Should Be Email
    Get Attribute    css=input[placeholder="Seu e-mail"]    
    ...    type    equal    email

Alert Text Should Be
    [Arguments]    ${field_type}    ${alert_message}
    Get Text       xpath=//input[@type="${field_type}"]/..//span    equal    ${alert_message}