*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    BuiltIn
Resource    ../modules/resources.robot
Resource    ../setting.robot

*** Variables ***
${ENDPOINT}     ${People_Search_R2D2}
${ENDPOINT_NO_RESULTS}     ${People_Search_NoResults}

*** Test Cases ***
Get People Search
    [Documentation]    驗證 GET ${ENDPOINT} 搜尋人物列表：200、count、results 結構
    Connect To Swapi
    Get Status
    ${resp}=          GET On Session    swapi    ${ENDPOINT}
    ${json}=          Get Value From Json    ${resp.json()}    results[0]
    Should Contain    ${json}\[name]    R2

Search no results
    [Documentation]    驗證 GET ${ENDPOINT_NO_RESULTS} 搜尋人物列表：404、detail 結構
    Connect To Swapi
    Get Status
    ${resp}=    GET On Session    swapi    ${ENDPOINT_NO_RESULTS}
    Log    ${resp.json()}
    ${count}=     Get Value From Json    ${resp.json()}    count
    ${Count}=     Convert JSON to string	${count}
    Should Be Equal   ${Count}      [0]
