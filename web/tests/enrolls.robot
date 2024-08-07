*** Settings ***
Documentation        Members enrolls suite test
...                  admin user, once logged in, can enroll new member in the gym

Resource             ../resources/base.resource

*** Test Cases ***
Api Login
    [Tags]

    ${member}       Get Fixture          member
    ${admin}        Get Fixture          admin
    
    Reset Student    ${member}[member][email]

    ${token}        Get Service Token    ${admin}

    POST New Student    ${token}    ${member}[member]

Deve matricular um aluno
    ${admin}        Get Fixture        admin
    ${member}       Get Fixture        member
    
    Reset Student    ${member}[member][email]
    ${token}        Get Service Token    ${admin}
    POST New Student    ${token}    ${member}[member]

    Do Login               ${admin}
    Go To Enrolls
    Go To Enroll Form
    Select Member          ${member}[member][name]
    Select Plan            ${member}[enroll][plan]
    Select Start Date
    Submit Enroll Form
    Verify Toaster       Matrícula cadastrada com sucesso
    Sleep    2
