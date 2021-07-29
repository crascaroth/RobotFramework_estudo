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
Cenário 01: Pesquisar produto existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da Busca

Cenário 02: Pesquisar produto não existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "produtoNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "produtoNãoExistente""

Cenário 03: Listar Produtos
    Dado que estou na página home do site
    Quando eu passar o mouse por cima da categoria "Women"
    E clicar na sub categoria "Summer Dresses"
    Então a página deve exibir os produtos da categoria "SUMMER DRESSES "


Cenário 04: Adicionar Produtos no Carrinho
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "t-shirt"
    E clicar no botão "Add to cart" do produto
    E clicar no botão "Proceed to checkout"
    Então a tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores

Cenário 05: Remover Produtos
    Dado que estou na página home do site
    Quando vou para a tela de compras
    E clico no botão para remover um produto
    Então a página deve exibir a mensagem "Your shopping cart is empty."

Cenário 06: Adicionar Cliente
    Dado que estou na página home do site
    Quando clicar no botão "Log in to your customer account"
    E Inserir um e-mail válido e criar conta
    E Preencher os campos de criação de e-mail