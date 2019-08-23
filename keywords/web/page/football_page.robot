*** Setting ***
Documentation  Home Page
Resource    ../../../resources/imports.robot


*** Variables ***
${img_football}      xpath=(//img[@src="/static/football-icon.svg"])[last()]
${lbl_premier_league}   xpath=(//a[@href="/football/premier-league"])[1]


*** Keywords ***
Verify football page display
    [Documentation]  Check football page show
    page should contain element     ${img_football}


Choose premier league on menu
    [Documentation]  Choose premier league on menu
    wait until element is enabled    ${lbl_premier_league}
    click element   ${lbl_premier_league}
