*** Settings ***
Library  Selenium
Resource         ../Resources/Resource.robot

### SETUP ele roda keywords, antes das suites ou dos testes
### TEARDOWN ele roda keyword, depois de uma suite ou teste

Test Setup       Abrir Navegador
Test Teardown    Fechar Navegador

*** Variables ***

${URL}       http://automationpractice.com/
${BROWSER}   chrome
*** Test Case ***
Cenário 01: Pequisar produto existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da Busca

Cenário 02: Pesquisar produto não existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "produtoNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "produtoNãoExistente""

*** Keywords ***

Dado que estou na página home do site
    Acessar página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar nome do produto "${PRODUTO}"
    Clicar no botão Pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado da Busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"
