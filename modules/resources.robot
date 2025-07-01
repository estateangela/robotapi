*** Settings ***
Documentation           This is a resource file.
Library                 RequestsLibrary
Resource                ../setting.robot

*** Keywords ***
Connect To Swapi  
    Create Session    swapi    ${BASE_URL}

Get Status
    ${resp}=          GET On Session    swapi    ${ENDPOINT}
    Status Should Be    200    ${resp}

Get Json Value
    ${json}=          Get Value From Json    ${resp.json()}