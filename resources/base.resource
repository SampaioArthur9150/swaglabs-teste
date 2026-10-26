*** Settings ***
Library    SeleniumLibrary
Resource    ../configs/variables.resource

*** Variables ***

${btn_menu}    id=react-burger-menu-btn
${reset}    id=reset_sidebar_link
${logout}    id=logout_sidebar_link
${dynamic_catalogue}    id=dynamic_catalog_sidebar_link

*** Keywords ***

Abrir Navegador
    [Documentation]    Abre navegador e pagina do swaglabs
    Open Browser    ${host}    Chrome
Fechar Navegador
    [Documentation]    Fecha navegador e encerra sessao
    Close Browser

Verificar Página
    [Documentation]    Verifica a atual pagina
    [Arguments]    ${expected_url}    ${expected_title}
    Wait Until Location Contains    ${expected_url}    
    Wait Until Keyword Succeeds    10s    500ms    Title Should Be    ${expected_title}

Acessar Menu
    [Documentation]    Acessa menu lateral da pagina de inventario
    [Arguments]    ${botao_menu}    ${link}
    Wait Until Element is Visible    ${botao_menu}
    Click Button     ${botao_menu}
    Wait Until Element Is Visible    ${link}
    Click Element    ${link}

