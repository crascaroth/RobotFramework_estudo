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

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible      css=#center_column > h1
    Title Should Be                    Search - My Store
    Page Should Contain Image          xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible      xpath=//*[@id="center_column"]/p
    Element Text Should Be             xpath=//*[@id="center_column"]/p   ${MENSAGEM_ALERTA}
