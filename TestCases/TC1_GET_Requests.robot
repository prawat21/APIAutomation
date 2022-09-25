*** Settings ***
Library   RequestsLibrary
Library    Collections

*** Variables ***

${base_url}   http://ergast.com
${season}    2008

*** Test Cases ***

Get_circuitsInfo
     Create Session    mysession    ${base_url}
     ${response} =      GET On Session    mysession    api/f1/${season}/circuits.json
        #log to console      ${response.status_code}
        #log to console      ${response.content}
        #Log To Console      ${response.headers}

        #Validations
       ${status_code} =   Convert To String     ${response.status_code}
       Should Be Equal      ${status_code}      200

        ${body} =     Convert To String          ${response.content}
        Should Contain  ${body}     Japan
        ${contentTypeValue} =   Get From Dictionary    ${response.headers}    Content-Type
        Should Be Equal      ${status_code}      200
