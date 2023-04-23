*** Settings ***

Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Library    String
Variables    Variables.py

*** Keywords ***
Tekan Tombol Wishlist
    Click Element    xpath=/html/body/div[3]/div[1]/div/ul[2]/li[3]/a
Periksa pernah membuat wishlist atau belum
    ${cek_wishlist}  Run Keyword And Return Status    Page Should Contain    You don't have any wishlist yet.
    Set Global Variable    ${cek_wishlist}
Membuat wishlist
    Run Keyword If    '${cek_wishlist}'=='True'    Membuat wishlist pertama    ELSE    Membuat wishlist kedua(${wishlist_pertama})
Membuat wishlist pertama
    Click Element    xpath://a[@class="create-wishlist"]
    Page Should Contain    Create new wishlist
    Wait Until Element Is Visible    xpath://input[@type="text" and @placeholder="Wishlist name"]
    Input Text    xpath://input[@type="text" and @placeholder="Wishlist name"]    ${wishlist_pertama}
    Click Button    xpath://button[@type="submit" and @class="btn btn-primary pull-right"]
Periksa wishlist berhasil dibuat(${y})
    Page Should Contain    Record saved
    ${x}    Get Text       xpath=/html/body/div[3]/div[7]/div[4]/div/div[5]/h1
    Should Be Equal As Strings    ${y}    ${x}    msg=Nama wistlist tidak sesuai dengan yang dibuat
Periksa wishlist kosong
    Page Should Contain    No items in this wishlist.
Membuat wishlist kedua(${x})
    Tekan Tombol Wishlist
    Click Element    xpath=/html/body/div[3]/div[6]/div[1]/div[1]/div/a
    Page Should Contain    Create new wishlist
    Wait Until Element Is Visible    xpath://input[@type="text" and @placeholder="Wishlist name"]
    Input Text    xpath://input[@type="text" and @placeholder="Wishlist name"]    ${x}  
    Click Element    xpath=/html/body/div[10]/div/div/div[2]/div/div/form/div[2]/button
Periksa wishlist sudah ada
    Page Should Contain    You already have a wishlist with that name
Membuat wishlist yang belum ada
    Membuat wishlist kedua(${wishlist_kedua})
Tekan tombol edit
    Click Element    xpath://div[@class="btn-edit-text"]
    Wait Until Element Is Visible    xpath=/html/body/div[11]/div/div/div[2]/div/form/div[1]/input
Masukkan nama wishlist
    Input Text    xpath=/html/body/div[11]/div/div/div[2]/div/form/div[1]/input    ${edit_wishlist}
Tekan tombol save
    Click Element    xpath=/html/body/div[11]/div/div/div[2]/div/form/div[4]/button
Periksa nama wishlist berhasil diubah
    Page Should Contain    Your wishlist has been updated
    ${x}    Get Text       xpath=/html/body/div[3]/div[7]/div[4]/div/div[5]/h1
    Should Be Equal    ${edit_wishlist}    ${x}    msg=Nama wistlist tidak sesuai dengan yang diedit