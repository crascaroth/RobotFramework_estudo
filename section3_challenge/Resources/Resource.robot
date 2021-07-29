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

###Cenário 01



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


### Cenário 02

Dado que estou na página home do site
    Acessar página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar nome do produto "${PRODUTO}"
    Clicar no botão Pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado da Busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"
### Cenário 03

Quando eu passar o mouse por cima da categoria "${CATEGORY}"
    Mouse Over                       xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORY}"]

E clicar na sub categoria "${SUB_CATEGORY}"
    Wait Until Element Is Visible    xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/*[@title="${SUB_CATEGORY}"]
    Click Element                    xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/*[@title="${SUB_CATEGORY}"]

Então a página deve exibir os produtos da categoria "${SUB_CATEGORY}"
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/h1/*[@class="cat-name"]
    Element Text Should Be           xpath=//*[@id="center_column"]/h1/*[@class="cat-name"]   ${SUB_CATEGORY}


### Cenário 04

E clicar no botão "${ADD_TO_CART}" do produto
    Wait Until Element Is Visible        xpath=//*[@id="center_column"]/ul/li/div/div[1]/div
    Mouse Over                           xpath=//*[@id="center_column"]/ul/li/div/div[1]/div
    Click Element                        xpath=//*[@id="center_column"]//*[@title="${ADD_TO_CART}"]
    
E clicar no botão "${PROCEED_TO_CHECKOUT}"
    Wait Until Page Contains             xpath=//*[@id="layer_cart"]//*[@title="${PROCEED_TO_CHECKOUT}"]
    Click Element                        xpath=//*[@id="layer_cart"]//*[@title="${PROCEED_TO_CHECKOUT}"]´

Então a tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores
    Title Should Be                      Order - My Store


### Cenário 05

Quando vou para a tela de compras
    Click Element                        xpath=//*[@id="header"]//*[@title="View my shopping cart"]
    Title Should Be                      Order - My Store

E clico no botão para remover um produto
    Wait Until Element Is Visible        xpath=//*[@id="1_1_0_0"]
    Click Element                        xpath=//*[@id="1_1_0_0"]

Então a página deve exibir a mensagem "${MENSAGEM}"
    Wait Until Element Is Visible      //*[@id="center_column"]/*[@class="alert alert-warning"]
    Element Text Should Be             //*[@id="center_column"]/*[@class="alert alert-warning"]   ${MENSAGEM_ALERTA}


### Cenário 06
Quando clicar no botão "${SIGN_IN}"
    Wait Until Element Is Visible    xpath=//*[@id="header"]//*[@title="${SIGN_IN}"]
    Click Element                    xpath=//*[@id="header"]//*[@title="${SIGN_IN}"]

Quando Inserir um e-mail válido e criar conta
    Wait Until Element Is Visible    xpath=//*[@id="email_create"]
    ${EMAIL}                         Generate Random String
    Input Text                       ${EMAIL}@robotTest.com
    Click Element                    xpath=//*[@id="email_create"]
