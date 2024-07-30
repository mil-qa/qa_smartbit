*** Settings ***
Documentation            API REST students route

Library                  RequestsLibrary
Resource    ../base.resource

*** Keywords ***
POST New Student
    [Arguments]     ${token}        ${student}
    ${header}       Create Dictionary    Authorization=${token}

    ${response}     POST            
    ...             url=http://localhost:3333/students
    ...             json=${student}
    ...             headers=${header}
    ...             expected_status=201