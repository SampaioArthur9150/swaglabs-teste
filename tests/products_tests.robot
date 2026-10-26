*** Settings ***

Library    SeleniumLibrary
Resource    ../configs/variables.resource
Resource    ../resources/base.resource
Resource    ../resources/login.resource
Resource    ../resources/products.resource

Test Setup    base.Abrir Navegador
Test Teardown    base.Fechar Navegador

*** Test Cases ***

Fluxo Básico - Adicionar produto ao carrinho
    [Documentation]    Adiciona produto ao carrinho
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    products.Adicionar Produto ao Carrinho    ${add_backpack_btn}    Remove

Fluxo Básico - Remover produto do carrinho
    [Documentation]    Adiciona e depois remove produto do carrinho
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    products.Remover Produto do Carrinho    ${remove_backpack_btn}    Add to cart

Fluxo Básico - Acessar produto
    [Documentation]    Acessa pagina de produto
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    Wait Until Element Is Visible    ${backpack_link}
    products.Acessar Produto

Fluxo Básico - Filtrar produto A-Z
    [Documentation]    Filtra produto em ordem alfabetica
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    products.Ordenar Produtos    az    Name (A to Z)

FA-01 - Filtrar produto Z-A
    [Documentation]    Filtra produto em ordem alfabetica inversa
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    products.Ordenar Produtos    za    Name (Z to A)

FA-02 - Filtrar produto baseado em preco baixo-alto
    [Documentation]    Filtra produto baseado em preco, do mais baixo ao mais alto
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    products.Ordenar Produtos    lohi    Price (low to high)

FA-03 - Filtrar produto baseado em preco alto-baixo
    [Documentation]    Filtra produto baseado em preco, do mais alto ao mais baixo
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    products.Ordenar Produtos    hilo    Price (high to low)

Fluxo Básico - Mudar organizacao do catalogo
    [Documentation]    Muda disposicao do catalogo
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    products.Mudar de Catalogo     ${lazyload_link}    Dynamic Catalog - Lazy Load

FA-04 - Catalogo spinner
    [Documentation]    Muda disposicao do catalogo para spinner
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    products.Mudar de Catalogo     ${spinner_link}    Dynamic Catalog - Spinner

FA-05 - Catalogo slider
    [Documentation]    Muda disposicao do catalogo para slider
    login.Fazer Login    ${user_standard}    ${password}
    base.Verificar Página    /inventory.html    Swag Labs
    products.Mudar de Catalogo     ${slider_link}    Dynamic Catalog - Slider