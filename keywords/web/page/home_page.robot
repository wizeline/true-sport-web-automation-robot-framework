*** Setting ***
Documentation  Home Page
library  Dialogs
Resource    ../../../resources/imports.robot


*** Variables ***
${lbl_football}  xpath=(//a[@href="/football"])[last()]


*** Keywords ***
Open Home Page
    [Documentation]  Navigate to home page
    open browser    ${home_page_url}  chrome
    set window size  ${1600}  ${1200}
Check go to homepage
    [Documentation]  Check home page show
    page should contain element     id=allSports

Choose football option on desktop
    [Documentation]  Choose football on menu
    wait until element is enabled    ${lbl_football}
    click element   ${lbl_football}

Close home page
    [Documentation]  Close home page
    close browser
