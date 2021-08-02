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
    log           ${RESPONSE.text}