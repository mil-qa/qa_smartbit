*** Settings ***
Documentation            Toaster components
Library                  Browser

*** Keywords ***
Verify Toaster
    [Arguments]        ${toaster_message}
    Wait For Elements State    
    ...    css=.Toastify__toast-body div >> text=${toaster_message}        
    ...    visible        5
    
    Wait For Elements State    
    ...    css=.Toastify__toast-body    detached    10