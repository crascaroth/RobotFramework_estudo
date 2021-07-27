*** Settings ***
Library  Selenium

*** Variables ***

${URL}       http://automationpractice.com/
${BROWSER}   chrome

*** Keywords ***

Abrir Navegador
    Open Browser   ${URL}   ${BROWSER}

Fechar Navegador
    Close Browser