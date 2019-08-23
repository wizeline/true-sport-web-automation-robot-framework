*** Settings ***
Documentation    Suite description
Resource    ../../resources/imports.robot

*** Keywords ***
Get numbers of teams belong to premier league
    log to console  \nURL: ${api_host}${teams_url}
    create session  getTotalTeamsPremierLeague  ${api_host}${teams_url}
    ${response}=   get request      getTotalTeamsPremierLeague   ?league_code=premier-league&fields=id%2Ctitle%2Cthumb
    ${resp_json}=  to json  ${response.text}
    log to console  ${resp_json['total']}
    [Return]  ${resp_json['total']}
