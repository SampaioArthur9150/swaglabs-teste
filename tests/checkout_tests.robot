*** Settings ***

Library    SeleniumLibrary
Resource    ../configs/variables.resource
Resource    ../resources/base.resource
Resource    ../resources/login.resource
Resource    ../resources/products.resource
Resource    ../resources/checkout.resource

Test Setup    base.Abrir Navegador
Test Teardown    base.Fechar Navegador

*** Test Cases ***

Fluxo Básico - Acessar carrinho
    [Documentation]    Acessa o carrinho com sucesso
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    checkout.Acessar Carrinho

Fluxo Básico - Terminar Compra
    [Documentation]    Cumpre os passos para o checkout
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    products.Adicionar Produto ao Carrinho    ${add_backpack_btn}    Remove
    checkout.Realizar Checkout    nome    sobrenome    endereco

FA-01 - Continuar comprando 
    [Documentation]    Volta a pagina de inventario apos clicar em carrinho
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    products.Adicionar Produto ao Carrinho    ${add_backpack_btn}    Remove

FE-01 - Fazer Checkout com informacao faltando
    [Documentation]    Falha no checkout por falta de informacao 
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    checkout.Falha no Checkout    sobrenome    endereco

FE-02 - Fazer Checkout sem itens no carrinho
    [Documentation]    Faz checkout sem ter itens no carrinho
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    checkout.Realizar Checkout    nome    sobrenome    endereco