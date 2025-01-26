*** Settings ***
Library         RequestsLibrary 
Resource        ../resource/variables/variables.robot

*** Variables ***

${HOST}             https://api.github.com

*** Keywords ***

Iniciar Sessão
    Create Session    Mysession     ${HOST}       
    ${HEADERS}         Create Dictionary     Authorization=${ACCESSTOKEN}        