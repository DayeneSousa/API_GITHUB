*** Settings ***                                                                                       
                                                                           
Library        RequestsLibrary 
Resource       ../resource/github.resource
Resource        ../resource/variables/variables.robot
Library         String





*** Keywords ***

Informar dados do USuario Válido ${ID_USUARIO}     
    ${response}=        GET     url= ${HOST}/${ENDPOINT_USER}/${ID_USUARIO}        expected_status=200

    [Return]     ${response}





Validar id e tipo do usuario 

   ${response_keyword} =  Informar dados do USuario Válido ${ID_USUARIO}     
   
    Should Not Be Equal As Strings      ${response_keyword.json()["login"]}        "ezmobius"

    Should Not Be Equal As Strings      ${response_keyword.json()["type"]}      "User"
    
    Log      ${response_keyword.json()}
    
 

Informar dados do USuario inVálido
    Get    url= ${HOST}/${ENDPOINT_USER}/1111111458881        expected_status=404



*** Test Cases ***

CT01- Iniciando Autenticação Básica
     Iniciar Sessão   

CT02 - Verificar dados do Usuario Válido
         
    Informar dados do USuario Válido 5  
    Validar id e tipo do usuario     
      

CT03 - Verificar dados do Usuario Inválido
      
    Informar dados do USuario inVálido

