### Variáveis ###

@{ELEMENTS}   Summer Dresses   Printed Summer Dress    Printed Chiffon Dress

@{ID}        center_column

### Keywords ###
Conferir se os produtos da sub-categoria "${SUBCATEGORIA}" foram mostrados na página
    Page Should Contain Element    xpath=//*[@id="${ID[0]}"]/h1/span[contains(text(), "${ELEMENTS[0]}")]
    Page Should Contain Element    xpath=//*[@id="${ID[0]}"]/ul/li[1]/div/div[2]/h5/a[@title="${ELEMENTS[1]}"]
    Page Should Contain Element    xpath=//*[@id="${ID[0]}"]/ul/li[2]/div/div[2]/h5/a[@title="${ELEMENTS[1]}"]
    Page Should Contain Element    xpath=//*[@id="${ID[0]}"]/ul/li[3]/div/div[2]/h5/a[@title="${ELEMENTS[2]}"]
    
    
    
Criar um E-mail Válido
[Arguments]                             ${NOME}   ${SOBRENOME}
${STRING_ALEATORIA}                     Generate Random String
${CUSTOM_EMAIL}                         Set Variable   ${NOME}${SOBRENOME}${STRING_ALEATORIA}@testerobot.com.br
Log                                     ${CUSTOM_EMAIL}     
[Return]                                ${CUSTOM_EMAIL}

Informar Um E-mail Válido
${EMAIL}    Criar um E-mail Válido   ${CLIENTE.nome}   ${CLIENTE.sobrenome}
