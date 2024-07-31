*** Settings ***
Documentation        verify if application is up
Library              Browser


*** Test Cases ***
Portal Admin Should Be Online
    New Browser      headless=False        browser=chromium
    New Page         http://localhost:3000/
    Get Text         h1        contains        Painel do Administrador
    Sleep            1