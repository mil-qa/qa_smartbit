*** Settings ***
Documentation            API REST enrolls route

Library                  RequestsLibrary
Library                  DateTime
Resource                 ../base.resource

*** Keywords ***
POST New Enroll
    [Arguments]     ${token}        ${student_id}
    ${header}       Create Dictionary    Authorization=${token}
    
    ${start_date}    Get Current Date

    ${enroll}       Create Dictionary        
    ...             start_date=${start_date}
    ...             plan__id=1
    ...             student_id=${student_id}

    ${response}     POST            
    ...             url=http://localhost:3333/enrollments
    ...             json=${enroll}
    ...             headers=${header}
    ...             expected_status=201