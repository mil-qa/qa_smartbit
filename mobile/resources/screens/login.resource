*** Settings ***
Documentation        login page representation file

Library              AppiumLibrary

*** Variables ***
${API_URL}        http://192.168.1.2:3333

*** Keywords ***
Login With Student Id
    [Arguments]        ${student_id}
    Input Text        xpath=//android.widget.EditText[@text="Informe o endereço ip da api"]
    ...               ${API_URL}
    Input Text        xpath=//android.widget.EditText[@text="Informe seu código de acesso"]
    ...               ${student_id}
    Click Element     xpath=//android.widget.TextView[@text="Entrar"]