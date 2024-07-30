*** Settings ***
Documentation        Managing test mass through database

Library              DatabaseLibrary


*** Keywords ***
Connect To Postgres
    Connect To Database    psycopg2
    ...                    smartbit
    ...                    postgres
    ...                    pwd123
    ...                    localhost
    ...                    5432

Select Student Where Email
    [Arguments]            ${email}
    ${query}               Set Variable
    ...                    SELECT * FROM public.students WHERE email = '${email}';
    
    ${result}              Query                  ${query}
    RETURN                 ${result}[0]


Delete Enroll By Email
    [Arguments]            ${member_email}
    ${member}              Select Student Where email        ${member_email}
    ${query}               Set Variable
    ...                    DELETE FROM public.enrollments WHERE student_id = '${member}[0]';
       
    Execute Sql String     ${query}

Delete Student By Email
    [Arguments]        ${email}

    ${query}            Set Variable 
    ...                 DELETE FROM public.students WHERE email='${email}';
    
    Execute Sql String    ${query}

# * Helper
Reset Student
    [Arguments]         ${member}

    Connect To Postgres
    Delete Student By Email    ${member}
    Disconnect From Database