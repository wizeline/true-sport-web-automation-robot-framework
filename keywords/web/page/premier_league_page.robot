*** Setting ***
Documentation  Home Page
Resource    ../../../resources/imports.robot


*** Variables ***
${img_premier_league}      xpath=(//img[@src="/static/football-icon.svg"])[last()]
${lbl_teams}   xpath=(//a[@href="/football/premier-league/teams"])[1]


*** Keywords ***
Verify premier league page display
    [Documentation]  Check premier league page show
    page should contain element     ${img_premier_league}


Choose teams on menu
    [Documentation]  Choose teams on menu
    wait until element is enabled    ${lbl_teams}
    click element   ${lbl_teams}