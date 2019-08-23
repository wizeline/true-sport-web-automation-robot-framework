*** Settings ***
Documentation  Test suite description

Resource  ../../keywords/web/page/home_page.robot
Resource  ../../keywords/web/page/football_page.robot
Resource  ../../keywords/web/page/premier_league_page.robot

*** Variables ***


*** Test Cases ***
Check open home page - successfully

    When open home page
    And check go to homepage
    And choose football option on desktop
    and choose premier league on menu
    and choose teams on menu
    and close home page