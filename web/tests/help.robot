*** Settings ***
Documentation       Help order suite test

Resource            ../resources/base.resource

Test Teardown       Take Screenshot

*** Test Cases ***
Deve receber uma notificação de pedido de ajuda
    #* 1. Given that I have a valid member
    ${admin}      Get Fixture    admin
    ${member2}    Get Fixture    member2

    Reset Student       ${member2}[member][email]
    ${token}            Get Service Token    ${admin}
    ${student_id}       POST New Student    
    ...                 ${token}
    ...                 ${member2}[member]

    #* 2. When this valid member send a mobile help order
    POST Question       ${student_id}    ${member2}[question]

    #* 3. Then I see a notification on Admin Panel
    Do Login            ${admin}
    Open notification
    Notification Should Be    ${member2}[question]