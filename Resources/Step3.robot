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
    Wait Until Element Is Visible    xpath=/html/body/div[11]/div/div/div[2]/div/form/div[4]/a
Masukkan nama wishlist
    Input Text    xpath=/html/body/div[11]/div/div/div[2]/div/form/div[1]/input    ${edit_wishlist}
Tekan tombol save
    Click Element    xpath=/html/body/div[11]/div/div/div[2]/div/form/div[4]/button
Periksa nama wishlist berhasil diubah
    Page Should Contain    Your wishlist has been updated
    ${x}    Get Text       xpath=/html/body/div[3]/div[7]/div[4]/div/div[5]/h1
    Should Be Equal    ${edit_wishlist}    ${x}    msg=Nama wistlist tidak sesuai dengan yang diedit
Tekan tombol Delete Wishlist
    ${delete_wishlist}    Get Text       xpath=/html/body/div[3]/div[7]/div[4]/div/div[5]/h1
    Set Global Variable    ${delete_wishlist}
    Click Element    xpath=/html/body/div[11]/div/div/div[2]/div/form/div[4]/a
    Handle Alert    ACCEPT
Periksa wishlist berhasil dihapus
    ${x}    Get Text       xpath=/html/body/div[3]/div[7]/div[4]/div/div[5]/h1
    Should Not Be Equal As Strings    ${delete_wishlist}    ${x}    msg=Nama wistlist tidak sesuai dengan yang dibuat
Tekan Bestseller
    Click Element    xpath://a[@href="/bestsellers"]
Pilih barang
    ${titles}    Get Text    xpath=/html/body/div[3]/div[6]/div[2]/div[2]/div/div/div/div/div[1]/div[2]/h3/a
    Set Global Variable    ${titles}
    Click Element    xpath=/html/body/div[3]/div[6]/div[2]/div[2]/div/div/div/div/div[1]/div[2]/h3/a
Tekan tombol Add to Wishlist
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div[6]/div[7]/div/div[1]/div[1]/div[3]/div/div[3]/a[2]
    Click Element    xpath=/html/body/div[3]/div[6]/div[7]/div/div[1]/div[1]/div[3]/div/div[3]/a[2]
Pilih wishlist
    Sleep    3
    Click Element   xpath://select[@id="select-wishlists"]
    Select From List By Index    xpath://select[@id="select-wishlists"]    ${select_wishlist}
    ${nama_wishlist}    Get Selected List Label    xpath=/html/body/div[13]/div/div/div[2]/div/div/div[2]/form/div[1]/select
    Set Global Variable    ${nama_wishlist}
    Click Element    xpath=/html/body/div[13]/div/div/div[2]/div/div/div[2]/form/div[2]/button
Periksa barang berhasil ditambahkan
    Sleep    3
    Page Should Contain    Item added to ${nama_wishlist}
    Click Element    xpath=/html/body/div[13]/div/div/div[2]/div/a
    ${y}    Get Text    xpath=/html/body/div[3]/div[6]/div[4]/div/div[7]/div/div/div[1]/div[2]/h2/a
    Should Be Equal    ${titles}    ${y}

    