*** Settings ***
Library    SeleniumLibrary
Resource    ../configs/variables.resource
Resource    ../resources/base.resource
Resource    ../resources/login.resource

Test Setup    base.Abrir Navegador
Test Teardown    base.Fechar Navegador

*** Test Cases ***

Fluxo Básico - Fazer Login com sucesso 
    [Documentation]    Faz login com username e senha corretas
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs

Fluxo Básico - Fazer Logout
    [Documentation]    Faz o login, acessa o menu e faz logout
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    base.Acessar Menu    ${btn_menu}    ${logout}

FE-01 - Fazer login com username invalido
    [Documentation]    Falha no login devido a username errado
    login.Falha no Login    user    ${password}    ${msg_login_error}

FE-02 - Fazer login com senha invalida
    [Documentation]     Falha no login devido a senha errada
    login.Falha no Login    ${user_standard}    senhasenha    ${msg_login_error}

FE-03 - Fazer login com username e senha invalida
    [Documentation]    Falha no login devido a ambas credenciais erradas
    login.Falha no Login    user    senhasenha    ${msg_login_error}

FE-04 - Fazer login com usuario bloqueado
    [Documentation]    Falha no login por tentar entrar com usuario bloqueado
    login.Falha no Login     ${user_locked}    ${password}    ${msg_locked_user}