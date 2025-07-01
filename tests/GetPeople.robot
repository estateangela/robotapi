*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    BuiltIn
Resource    ../modules/resources.robot

*** Variables ***
${BASE_URL}     https://swapi.dev/api
${ENDPOINT}     /people/

*** Test Cases ***
Get People List
    [Documentation]    驗證 GET ${ENDPOINT} 回傳人物列表：200、count、results 結構
    Connect To Swapi and Get Status
    ${resp}=          Get Request    swapi    ${ENDPOINT}
    ${json}=          Get Value From Json    ${resp.json()}    count
    Should Be True    ${resp.json()}[count] > 0    Count should be greater than 0
    ${results}=       Get Value From Json    ${resp.json()}    results
    Should Be True    len(${results}) > 0    Results list should not be empty
    ${first}=          Get Value From Json    ${resp.json()}    results[0]
    Should Not Be Empty    ${first}\[name]
    Should Not Be Empty    ${first}\[gender]
    Should Not Be Empty    ${first}\[birth_year]
    