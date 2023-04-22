*** Settings ***

Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Library    String
Variables    Variables.py

*** Keywords ***
Membuka Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Announcement
    Click Element  xpath://button[@class="close"]
Klik Join
    Click Element    xpath://a[@href="/account/login/to/account"] 
Masukkan Email dan Password
    Select Frame    xpath://iframe[@class='signin-iframe']
    input text    id=ap_email  ${email}
    Input Text    id=ap_password    ${password}
    Click Button    id=signInSubmit
Periksa Berhasil login
    Page Should Contain    My Account
    ...                    Sign out