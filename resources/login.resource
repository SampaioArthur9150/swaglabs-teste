*** Settings ***
Library    SeleniumLibrary
Resource    base.resource

*** Variables ***

${input_username}    id=user-name
${input_password}    id=password
${login_btn}    id=login-button

*** Keywords ***

Fazer Login
    [Documentation]    Tenta fazer login
    [Arguments]    ${usuario}    ${senha}
    Input Text    ${input_username}    ${usuario}
    Input Text    ${input_password}    ${senha}
    Click Button    ${login_btn}

Falha no Login
    [Documentation]    Login falho
    [Arguments]    ${usuario}    ${senha}    ${expected_msg}
    Fazer Login    ${usuario}    ${senha}
    Wait Until Page Contains    ${expected_msg}