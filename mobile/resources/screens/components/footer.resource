*** Settings ***
Documentation            footer components

Library                  AppiumLibrary

*** Variables ***
${help_button}            xpath=//android.widget.TextView[@text="Pedir ajuda"]

*** Keywords ***
Go To Help Order
    Wait Until Element Is Visible    ${help_button}    timeout=5
    Click Element                    ${help_button}