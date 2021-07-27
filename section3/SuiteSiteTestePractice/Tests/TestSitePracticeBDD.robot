*** Settings ***
Library  Selenium

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