*** Settings ***
Documentation           This is a resource file.
Library                 RequestsLibrary


*** Variables ***
${BASE_URL}     https://swapi.dev/api

*** Keywords ***
Connect To Swapi and Get Status
    Create Session    swapi    ${BASE_URL}
    ${resp}=          Get Request    swapi    ${ENDPOINT}
    Status Should Be    200    ${resp}