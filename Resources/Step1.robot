*** Settings ***

Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Library    String
Variables    Variables.py

*** Keywords ***
Masukkan Keyword Invalid
    Input Text    xpath://input[@name='searchTerm']    ${search_invalid}
Periksa Invalid Search
    Page Should Contain    Your search did not return any results.
Masukkan Keyword Valid
    Input Text    xpath://input[@name='searchTerm']    ${search_valid}
Klik Tombol Search
    Click Button    xpath://form[@id='book-search-form']/div/button
Periksa Valid Search
    Page Should Contain    Search results for ${search_valid}
    ...                    Showing
Periksa Tombol Dropdown Sort
    Page Should Contain Element    xpath://select[@name='searchSortBy']
Klik Price, low to high
    Select From List By Index    name=searchSortBy    ${low_to_high}
Klik Price, high to low
    Select From List By Index    name=searchSortBy    ${high_to_low}
Check Sorting Low to High  
    ${list}    Create List   
    ${raw}     Create List    
    FOR    ${i}    IN RANGE    1    ${data_sample}+1
         ${status}    Run Keyword And Return Status    Page Should Contain Element     xpath=/html/body/div[3]/div[6]/div[5]/div[4]/div/div/div/div/div[${i}]/div[2]/div[2]/p/span
         Log To Console    ${status} 
         IF    ${status} == True
            ${price}   Get Text     xpath=/html/body/div[3]/div[6]/div[5]/div[4]/div/div/div/div/div[${i}]/div[2]/div[2]/p/span
            Log To Console    ${price} 
            Append To List    ${raw}    ${price}
        ELSE
            ${status2}    Run Keyword And Return Status    Page Should Contain Element     xpath=/html/body/div[3]/div[6]/div[5]/div[4]/div/div/div/div/div[${i}]/div[2]/div[2]/p[1]/span[1]
            Log To Console    ${status}
            IF    ${status2} == True
                ${price}   Get Text     xpath=/html/body/div[3]/div[6]/div[5]/div[4]/div/div/div/div/div[${i}]/div[2]/div[2]/p[1]/span[1]
                Log To Console    ${price}
                Append To List    ${raw}    ${price}
            END
         END
        # ${price}   Get Text     xpath=/html/body/div[3]/div[6]/div[5]/div[4]/div/div/div/div/div[${i}]/div[2]/div[2]/p/span
        # Append To List    ${raw}    ${price}
    END

    FOR    ${x}    IN    @{raw}
        ${price}    Remove String        ${x}   Rp    .
        ${price}    Convert To Integer    ${price}
        ${y}     Set Variable    ${price}
        Append To List    ${list}    ${y}
    END

    ${copy}    Copy List    ${list}
    Sort List    ${list}
    #  Log To Console    ${list} 
    #  Log To Console    ${copy}
    Lists Should Be Equal    ${copy}    ${list}    msg=Harga tidak tersortir dari rendah ke tinggi