*** Settings ***
Documentation        Members enrolls suite test
...                  admin user, once logged in, can enroll new member in the gym

Resource             ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    ${admin}        Get Fixture        admin
    ${member}       Get Fixture        member
    
    Reset Member Enroll    ${member}[email]

    Do Login               ${admin}
    Go To Enrolls
    Go To Enroll Form
    Select Member          ${member}[name]
    Select Plan            ${member}[enroll][plan]
    Select Start Date
    Submit Enroll Form
    Verify Toaster       Matrícula cadastrada com sucesso
    Sleep    2
