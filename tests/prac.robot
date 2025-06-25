*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://api.bitopro.com/v3/
${DEFAULT_HEADERS}  {"Content-Type": "application/json"}

*** Keywords ***
Create Public Session
    [Documentation]    建立至 ${BASE_URL} 的 HTTP session
    Create Session    bitopro    ${BASE_URL}    headers=${DEFAULT_HEADERS}

Call Public GET
    [Arguments]    ${endpoint}    ${params}=None
    [Documentation]    呼叫 GET ${BASE_URL}${endpoint}，並回傳 response 物件
    ${resp}=    GET On Session    bitopro    ${endpoint}    params=${params}
    [Return]    ${resp}

Status Should Be
    [Arguments]    ${response}    ${expected_status}=200
    [Documentation]    驗證 response status code
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}

*** Test Cases ***
a
    Create Public Session
    Call Public GET    provisioning/currencies
    Request Should Be Successful