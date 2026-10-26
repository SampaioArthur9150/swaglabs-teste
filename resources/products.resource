*** Settings ***
Library    SeleniumLibrary
Resource    base.resource
Resource    ../configs/variables.resource

*** Variables ***

${add_backpack_btn}    id=add-to-cart-sauce-labs-backpack
${remove_backpack_btn}    id=remove-sauce-labs-backpack
${filter}    class=product_sort_container
${backpack_link}    id=item_4_img_link
${lazyload_link}    id=dynamic_catalog_lazy_load_link
${spinner_link}    id=dynamic_catalog_spinner_link
${slider_link}    id=dynamic_catalog_slider_link

*** Keywords ***

Adicionar Produto ao Carrinho
    [Documentation]    Adiciona produto ao carrinho
    [Arguments]    ${btn}    ${expected_text}
    Click Button    ${btn}
    Wait Until Element Is Visible    ${remove_backpack_btn}
    Element Text Should Be    ${remove_backpack_btn}    ${expected_text}

Remover Produto do Carrinho
    [Documentation]    Adiciona produto ao carrinho e depois o remove
    [Arguments]    ${btn}    ${expected_text}
    Adicionar Produto ao Carrinho    ${add_backpack_btn}    Remove
    Click Button    ${btn}
    Wait Until Page Contains Element   ${add_backpack_btn}
    Element Text Should Be    ${add_backpack_btn}    ${expected_text}

Acessar Produto
    [Documentation]    Abre pagina de produto
    Click Element     ${backpack_link}
    Page Should Contain    Sauce Labs Backpack

Ordenar Produtos
    [Documentation]    Filtra produtos
    [Arguments]    ${filter_item}    ${expected_text}
    Wait Until Element Is Visible    ${filter}
    Select From List By Value    ${filter}    ${filter_item}
    List Selection Should Be    ${filter}    ${expected_text}

Mudar de Catalogo
    [Documentation]    Muda forma em que produtos sao dispostos
    [Arguments]    ${link}    ${expected_text}
    base.Acessar Menu    ${btn_menu}    ${dynamic_catalogue}
    Wait Until Element Is Visible    ${link}
    Click Element    ${link}
    Wait Until Keyword Succeeds    20s    500ms    Page Should Contain    ${expected_text}
    
