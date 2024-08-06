*** Settings ***
Documentation            popup components

Library                  AppiumLibrary

*** Variables ***
${ok_button}            id=android:id/buton1

*** Keywords ***
Confirm Popup
    Wait Until Element Is Visible    ${ok_button}    timeout=5
    Click Element                    ${ok_button}