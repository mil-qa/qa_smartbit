*** Settings ***
Documentation            notification components
Library                  Browser

*** Keywords ***
Open notification
    Click               (//aside//button)[1]

Notification Should Be
    [Arguments]        ${notification}
    ${element}         Set Variable        css=.scrollbar-container p

    Wait For Elements State    ${element}
    ...                        visible
    ...                        timeout=2
    Get Text    ${element}
    ...         equal
    ...         ${notification}