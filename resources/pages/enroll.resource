*** Settings ***
Library          Browser
Library          libs/DateTricks.py

*** Keywords ***
Go To Enrolls
    Click           css=a[href="/matriculas"]

Go To Enroll Form
    Click           css=a[href="/matriculas/new"]

Select Member
    [Arguments]     ${member_name}

    Fill Text       xpath=//div[contains(text(), "nome do aluno")]/..//input
    ...             ${member_name}
    # Para capturar elementos HTML que se escondem ao inspecionar
    # ${temp}         Get Page Source
    # Log             ${temp}
    Click           css=div[class$=option] >> text=${member_name}

Select Plan
    [Arguments]     ${member_plan}

    Click           xpath=//label[text()="PLANO"]/..//div[contains(text(), "Selecione")]
    # ${temp}         Get Page Source
    # Log             ${temp}
    Click           css=div[class$=option] >> text=${member_plan}

Select Start Date
    Focus                   css=input[name=start_date]

    ${member_start_date}    Get Start Date
    FOR    ${number}    IN    @{member_start_date}
        Keyboard Key    press    ${number}
    END