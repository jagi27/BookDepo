*** Settings ***

Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Library    String
Variables    Variables.py


*** Keywords ***
Tekan Tombol Keranjang
    Click Element    xpath=/html/body/div[3]/div[4]/div/div/div[3]/a
Cek keranjang kosong
    Page Should Contain    Your basket
    ...                    Your basket is empty.
Tekan Bestseller
    Click Element    xpath://a[@href="/bestsellers"]
Tekan Tombol Add to Basket
    Click Element    xpath=/html/body/div[3]/div[6]/div[2]/div[2]/div/div/div/div/div[1]/div[3]/div/a
Periksa muncul modal dialog
    ${titles}    Get Text    xpath=/html/body/div[3]/div[6]/div[2]/div[2]/div/div/div/div/div[1]/div[2]/h3/a
    Set Global Variable    ${titles}
    Page Should Contain    Item added to your basket
    Wait Until Element Is Visible    xpath://a[@class="btn btn-primary pull-right continue-to-basket string-to-localize link-to-localize" and @href="/basket"]
    Click Element    xpath://a[@class="btn btn-primary pull-right continue-to-basket string-to-localize link-to-localize" and @href="/basket"]
Periksa barang masuk keranjang
    Page Should Contain    Your basket
    ${title2}    Get Text    xpath=/html/body/div[3]/div[6]/div/div[2]/div[2]/div[2]/div[1]/div[2]/h2/a
    Should Be Equal As Strings    ${titles}    ${title2}    msg=Title buku yang ditambahkan tidak sama
Hapus barang
    Page Should Contain Button    xpath://button[@class="btn remove-btn"]
    Click Button    xpath://button[@class="btn remove-btn"]    
Add to Basket barang yang sama
    ${titles2}    Get Text    xpath=/html/body/div[3]/div[6]/div[2]/div[2]/div/div/div/div/div[1]/div[2]/h3/a
    Set Global Variable    ${titles2}
    FOR    ${i}    IN RANGE    1    ${qty}+1
        Click Element    xpath=/html/body/div[3]/div[6]/div[2]/div[2]/div/div/div/div/div[1]/div[3]/div/a
        Page Should Contain    Item added to your basket
        IF    ${i} == ${qty}
            Wait Until Element Is Visible    xpath://a[@class="btn btn-primary pull-right continue-to-basket string-to-localize link-to-localize" and @href="/basket"]
            Click Element    xpath://a[@class="btn btn-primary pull-right continue-to-basket string-to-localize link-to-localize" and @href="/basket"]
        ELSE
            Wait Until Element Is Visible    xpath://a[@data-dismiss="modal"]
            Click Element    xpath://a[@data-dismiss="modal"]
        END
    END
Periksa apakah jumlah yang ditambahkan sesuai
    IF    ${qty} > 9
        ${Qty_0}    Get Value    xpath://input[@id="Qty_0"]
    ELSE
        ${Qty_0}    Get Value    xpath://select[@id="Qty_0"]
    END
    Should Be Equal As Strings    ${qty}    ${Qty_0}    msg=Jumlah buku yang ditambahkan tidak sama
Add to Basket barang yang berbeda
    ${raw}     Create List 
    FOR    ${i}    IN RANGE    1    ${qty}+1
        ${x}    Get Text    xpath=/html/body/div[3]/div[6]/div[2]/div[2]/div/div/div/div/div[${i}]/div[2]/h3/a
        Append To List    ${raw}    ${x}
        Click Element     xpath=/html/body/div[3]/div[6]/div[2]/div[2]/div/div/div/div/div[${i}]/div[3]/div/a
        IF    ${i} == ${qty}
            Wait Until Element Is Visible    xpath://a[@class="btn btn-primary pull-right continue-to-basket string-to-localize link-to-localize" and @href="/basket"]
            Click Element    xpath://a[@class="btn btn-primary pull-right continue-to-basket string-to-localize link-to-localize" and @href="/basket"]
        ELSE
            Wait Until Element Is Visible    xpath://a[@data-dismiss="modal"]
            Click Element    xpath://a[@data-dismiss="modal"]
        END
    END
    Set Global Variable    ${raw}
Periksa buku yang ditambahkan ke keranjang
    ${list}    Create List
    FOR    ${i}    IN RANGE    2    ${qty}+2
        ${x}   Get Text     xpath=/html/body/div[3]/div[6]/div/div[2]/div[2]/div[${i}]/div[1]/div[2]/h2/a
        Append To List    ${list}    ${x}
    END
    List Should Contain Sub List    ${raw}    ${list}
Tambah jumlah barang
    IF    ${tambah} > 10
        Select From List By Value    name=quantity    10
        Input Text    xpath://input[@name='quantity']    ${tambah}
        Click Button    xpath://button[@class="btn update-btn"]
    ELSE
        Select From List By Value    name=quantity    ${tambah}
    END
Periksa tambah jumlah barang
    ${present}  Run Keyword And Return Status    Element Should Be Visible    xpath://select[@id='Qty_0']
    Run Keyword If    ${present}==True    cek<10    ELSE    cek>10    
cek>10
    Page Should Contain Element    xpath://input[@name='quantity']
    ${x}   Get Value     xpath://input[@name='quantity']
    Should Be Equal As Strings    ${tambah}    ${x}    msg=Ubah jumlah tidak sesuai
cek<10
    Page Should Contain Element    xpath://select[@name='quantity']
    ${x}   Get Value     xpath://select[@name='quantity']
    Should Be Equal As Strings    ${tambah}    ${x}    msg=Ubah jumlah tidak sesuai
Kurangi jumlah barang
    ${present}  Run Keyword And Return Status    Element Should Be Visible    xpath://select[@id='Qty_0']
    Run Keyword If    ${present}==True    select_value    ELSE    input_value
input_value
    Input Text    xpath://input[@name='quantity']    ${kurang}
    Click Button    xpath://button[@class="btn update-btn"]
select_value
    Select From List By Value    name=quantity    ${kurang}

Periksa kurang jumlah barang
    ${present}  Run Keyword And Return Status    Element Should Be Visible    xpath://select[@id='Qty_0']
    Run Keyword If    ${present}==True    cekk<10    ELSE    cekk>10    
cekk>10
    Page Should Contain Element    xpath://input[@name='quantity']
    ${x}   Get Value     xpath://input[@name='quantity']
    Should Be Equal As Strings    ${kurang}    ${x}    msg=Ubah jumlah tidak sesuai
cekk<10
    Page Should Contain Element    xpath://select[@name='quantity']
    ${x}   Get Value     xpath://select[@name='quantity']
    Should Be Equal As Strings    ${kurang}    ${x}    msg=Ubah jumlah tidak sesuai
get_select_value(${i})
    Page Should Contain Element    xpath=/html/body/div[3]/div[6]/div/div[2]/div[2]/div[${i}]/div[2]/form[1]/select
    ${x}   Get Value     xpath=/html/body/div[3]/div[6]/div/div[2]/div[2]/div[${i}]/div[2]/form[1]/select
    Append To List    ${jumlah_list}    ${x}
get_input_value(${i})
    Page Should Contain Element    xpath=/html/body/div[3]/div[6]/div/div[2]/div[2]/div[${i}]/div[2]/form[1]/input[4]
    ${x}   Get Value     xpath=/html/body/div[3]/div[6]/div/div[2]/div[2]/div[${i}]/div[2]/form[1]/input[4]
    Append To List    ${jumlah_list}    ${x}
Kalkulasi semua jumlah barang
    ${jumlah_list}    Create List
    Set Global Variable    ${jumlah_list}   
    ${raw}     Create List    
    FOR    ${i}    IN RANGE    2    ${qty}+2
        ${present}  Run Keyword And Return Status    Element Should Be Visible    xpath=/html/body/div[3]/div[6]/div/div[2]/div[2]/div[${i}]/div[2]/form[1]/input[4]
        Run Keyword If    ${present}==True    get_input_value(${i})    ELSE    get_select_value(${i})
    END
    ${sumx}   Evaluate    sum(map(int, ${jumlah_list}))
    Set Global Variable    ${sumx}
Periksa kalkulasi dengan total jumlah barang keranjang
    ${total}   Get Text    xpath://div[@class='basket-msg']
    ${q}   Get Text    xpath=/html/body/div[3]/div[6]/div/div[2]/div[1]/div[2]/dl[2]/dd
    ${xy}    Set Variable    You have ${sumx} items for a total of ${q} in your basket.
    Should Be Equal    ${total}    ${xy}
Kalkulasi semua harga barang
    ${list}    Create List   
    ${raw}     Create List    
    FOR    ${i}    IN RANGE    2    ${qty}+2
        ${price}   Get Text     xpath=/html/body/div[3]/div[6]/div/div[2]/div[2]/div[${i}]/div[2]/p
        Append To List    ${raw}    ${price}
    END

    FOR    ${x}    IN    @{raw}
        ${price}    Remove String        ${x}   Rp    .
        ${price}    Convert To Integer    ${price}
        ${y}     Set Variable    ${price}
        Append To List    ${list}    ${y}
    END
    ${sum}   Evaluate    sum(map(int, ${list}))
    Set Global Variable    ${sum}
Periksa kalkulasi dengan total harga keranjang
    ${total}   Get Text    xpath=/html/body/div[3]/div[6]/div/div[2]/div[1]/div[2]/dl[2]/dd
    ${z}    Remove String        ${total}   Rp    .
    ${z}    Convert To Integer    ${z}
    ${xy}     Set Variable    ${z}
    Should Be Equal    ${sum}    ${xy}
    


    