*** Settings ***
Resource         ../Resources/Resources.robot

Test Setup       Conectar API
Test Teardown    Fechar API

*** Variables ***


*** Test Case ***
Caso de Teste 01: Listar todos os livros
    Requisitar Todos os livros
    Conferir o Status Code   200
    Conferir o Reason        OK
    Conferir se retorna uma lista com "200" Livros
