*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${URL}       http://automationpractice.com/
${BROWSER}   chrome

*** Keywords ***

### Setup e Teardown ###

Abrir Navegador
    Open Browser   ${URL}   ${BROWSER}

Fechar Navegador
    Close Browser


### Passo-a-Passo ###
Acessar página home do site
    Title Should Be   My Store

Digitar nome do produto "${PRODUTO}"
    Input Text   name=search_query    ${PRODUTO}

Clicar no botão Pesquisar
    Click Element   name=submit_search