*** Settings ***
Library    SeleniumLibrary
Resource    base.resource
Resource    ../configs/variables.resource

*** Variables ***

${checkout}    id=checkout
${input_name}    id=first-name
${input_lastname}   id=last-name
${input_postalcode}    id=postal-code
${btn_continue}    id=continue
${btn_finish}    id=finish
${continue_shopping}    id=continue-shopping


*** Keywords ***

Acessar Carrinho
    [Documentation]    Abre o carrinho 
    Click Element    ${cart_link}
    Wait Until Element Is Visible    ${checkout}
    
Realizar Checkout
    [Documentation]    Abre o carrinho e segue os passos necessarios para finalizar o checkout
    [Arguments]    ${nome}    ${sobrenome}    ${codepostal}
    Acessar Carrinho
    Click Button    ${checkout}
    Wait Until Element Is Visible    ${input_name}
    Input Text    ${input_name}    ${nome}
    Input Text    ${input_lastname}    ${sobrenome}
    Input Text    ${input_postalcode}    ${codepostal}
    Click Button    ${btn_continue}
    Wait Until Element Is Visible    ${btn_finish}
    Page Should Contain    Checkout: Overview
    Click Button    ${btn_finish}

Continuar Compras
    [Documentation]    Abre o carrinho e volta para o inventario
    Acessar Carrinho
    Wait Until Element Is Visible    ${continue_shopping}
    Click Element    ${continue_shopping}

Falha no Checkout
    [Documentation]    Tenta fazer checkout sem o campo de nome
    [Arguments]    ${sobrenome}    ${codepostal}
    Acessar Carrinho
    Click Button    ${checkout}
    Wait Until Element Is Visible    ${input_name}
    Input Text    ${input_lastname}    ${sobrenome}
    Input Text    ${input_postalcode}    ${codepostal}
    Click Button    ${btn_continue}
    Page Should Contain     Error: First Name is required