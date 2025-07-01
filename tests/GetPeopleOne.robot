*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    BuiltIn

*** Variables ***
${BASE_URL}     https://swapi.dev/api
${ENDPOINT}     /people/1/

*** Test Cases ***
Get People One
    [Documentation]    驗證 GET ${ENDPOINT} 回傳人物資料：200、name、gender、birth_year 結構
    Create Session    swapi    ${BASE_URL}
    ${resp}=          Get Request    swapi    ${ENDPOINT}
    Status Should Be    200    ${resp} 
    ${name}=          Get Value From Json    ${resp.json()}    name     # 輸出 Luke Skywalker
    Should Contain    ${name}    Luke Skywalker
    ${height}=        Get Value From Json    ${resp.json()}    height
    Should Contain    ${height}    172
    ${mass}=          Get Value From Json    ${resp.json()}    mass
    Should Contain    ${mass}    77
   