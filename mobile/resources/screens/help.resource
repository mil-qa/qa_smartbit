*** Settings ***
Documentation        help page representation file

Library              AppiumLibrary

*** Variables ***
${help_button}     xpath=//android.widget.TextView[@text="Enviar dúvida"]
${help_txtarea}    xpath=//android.widget.EditText[@text="Escreva sua dúvida aqui"]

*** Keywords ***
Submit Help Order
    [Arguments]                      ${help_text}
    Wait Until Element Is Visible    ${help_button}    timeout=5
    Click Element                    ${help_button}
    Wait Until Element Is Visible    ${help_txtarea}    timeout=5
    Input Text                       ${help_txtarea}
    ...                              ${help_text}
    Click Text                       Enviar