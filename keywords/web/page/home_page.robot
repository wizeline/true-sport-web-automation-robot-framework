*** Setting ***
Documentation  Home Page
Resource    ../../../resources/imports.robot


*** Variables ***


*** Keywords ***
Open Home Page
    [Documentation]  Navigate to home page
    open browser    ${home_page_url}  chrome
    set window size  ${1600}  ${1200}
Check go to homepage
    [Documentation]  Check home page show
    page should contain element     id=allSports

Close home page
    [Documentation]  Close home page
    close browser
