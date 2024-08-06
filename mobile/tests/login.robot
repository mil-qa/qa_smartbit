*** Settings ***
Documentation            Login suite test

Resource                ../resources/base.resource

Test Setup        Start App
Test Teardown     Finish App

*** Test Cases ***
Deve logar com sucesso
    ${student}        Get Fixture        student
    
    Login With Student Id       ${student}[student][id]
    Wait Until Page Contains    Olá, ${student}[student][name]!