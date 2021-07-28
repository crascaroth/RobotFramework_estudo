*** Settings ***
Resource         ../Resources/Resource.robot

Test Setup       Abrir Navegador
Test Teardown    Fechar Navegador

*** Variables ***


*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    Acessar página home do site
    Digitar nome do produto "Blouse"
    Clicar no botão Pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    Acessar página home do site
    Digitar nome do produto "produtoNãoExistente"
    Clicar no botão Pesquisar
    Conferir mensagem de erro "No results were found for your search "produtoNãoExistente""

# *** Keywords ***