*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***

${URL_API}   https://fakerestapi.azurewebsites.net/api/v1/

*** Keywords ***

### Setup e Teardown ###

Conectar API
    Create Session   fakeAPI   ${URL_API}

Fechar API
    Delete All Sessions


### Keywords ###
Requisitar Todos os livros
    ${RESPONSE}   Get Request   fakeAPI   Books
    log                   ${RESPONSE.text}
    Set Test Variable     ${RESPONSE}

Conferir o Status Code   
    [Arguments]         ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPONSE.status_code}    ${STATUSCODE_DESEJADO}


Conferir o Reason            
    [Arguments]         ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPONSE.reason}    ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_LIVROS}" Livros
    Length Should Be    ${RESPONSE.json()}    ${QTDE_LIVROS}


Requisitar o livro "${ID_LIVRO}"
    ${RESPONSE}    Get Request      fakeAPI     books/${ID_LIVRO}
    Log                     ${RESPONSE.text}
    Set Test Variable       ${RESPONSE}

Conferir se retorna todos os dados corretos do livro "${ID}"
    Log     ${RESPONSE}
    Should Be Equal As Strings      15    ${ID}
    