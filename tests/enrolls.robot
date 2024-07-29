*** Settings ***
Documentation        Members enrolls suite test
...                  admin user, once logged in, can enroll new member in the gym

Resource             ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    # * 1 - Falcão | Plano Smart | Inicio 29/07/2024
    ${admin}        Create Dictionary
    ...             name=Admin
    ...             email=admin@smartbit.com
    ...             password=qacademy
    
    Do Login             ${admin}
    Go To Enrolls
    Go To Enroll Form
    Select Member        Falcão
    Select Plan          Smart
    Select Start Date

    Sleep           2