*** Setting ***
Documentation  Home Page
Resource    ../../../resources/imports.robot
Resource    ../../api/teams-keywords.robot

*** Variables ***
${img_premier_league_teams}      xpath=(//img[@src="/static/football-icon.svg"])[last()]
${xpath_of_teams}           //h3
${team_list}    Create List


*** Keywords ***
Verify all teams in premier league
    [Documentation]  Check all teams in premier league
    wait until element is visible  ${xpath_of_teams}
    ${number_of_teams}=  get element count  ${xpath_of_teams}
    ${number_of_teams_from_api}=  Get numbers of teams belong to premier league
    should be equal  ${number_of_teams}  ${number_of_teams_from_api}