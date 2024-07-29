*** Settings ***
Documentation        Authentication test suite
Resource             ../resources/base.resource

*** Test Cases ***
Login do Administrador
    Go To Login Page
    Fill credentials    admin@smartbit.com          qacademy
    Submit credentials
    User Should Be Logged In    Admin

Email não cadastrado
    Go To Login Page
    Fill credentials    404@smartbit.com            qacademy
    Submit credentials
    Verify Toaster      Suas credenciais são inválidas, por favor tente novamente!

Senha incorreta
    Go To Login Page
    Fill credentials    admin@smartbit.com          qacademi
    Submit credentials
    Verify Toaster      Suas credenciais são inválidas, por favor tente novamente!

Email no formato incorreto
    Go To Login Page
    Fill credentials    @com.br    abc123
    Submit credentials
    Field Type Should Be Email

Senha em branco
    Go To Login Page
    Fill credentials        admin@smartbit.com          ${EMPTY}
    Submit credentials
    Alert Text Should Be    password    A senha é obrigatória


Email em branco
    Go To Login Page
    Fill credentials        ${EMPTY}          qacademy
    Submit credentials
    Alert Text Should Be    email    O e-mail é obrigatório
