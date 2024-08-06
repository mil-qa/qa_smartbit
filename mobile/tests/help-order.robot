*** Settings ***
Documentation            Help order suite test

Resource                ../resources/base.resource

Test Setup        Start App
Test Teardown     Finish App
Library    Browser

*** Test Cases ***
Deve poder solicitar ajuda
    ${student2}    Get Fixture          student2
    ${admin}       Get Fixture          admin
    ${token}       Get Service Token    ${admin}

    Reset Student            ${student2}[student2][email]
    ${student_id}            POST New Student     
    ...                      ${token}        ${student2}[student2]
    POST New Enroll          ${token}        ${student_id}
    Login With Student Id    ${student_id}
    Confirm Popup
    Go To Help Order
    Submit Help Order        ${student2}[help]
    Wait Until Page Contains    Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber nosso feedback.
