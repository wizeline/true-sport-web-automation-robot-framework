*** Settings ***
Documentation  Test suite description

Resource  ../../keywords/web/page/home_page.robot


*** Variables ***


*** Test Cases ***
Check open home page - successfully

    When open home page
    And check go to homepage
    And close home page