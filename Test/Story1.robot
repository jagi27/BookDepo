*** Settings ***
Documentation    Search Data
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../Resources/Main.robot
Resource    ../Resources/Step1.robot

*** Test Cases ***
Membuka Browser Chrome
    [Documentation]    Membuka Browser
    [Tags]    open,browser
    Membuka Browser
Login User
    [Documentation]    Melakukan Login
    [Tags]    login,valid,positif
    Klik Join
    Masukkan Email dan Password
    Periksa Berhasil login
Mencari Buku Tidak Terdaftar
    [Documentation]    Mencari buku yang tidak terdaftar pada sistem
    [Tags]    search,invalid,negatif
    Masukkan Keyword Invalid
    Klik Tombol Search
    Periksa Invalid Search
Mencari Buku Terdaftar
    [Documentation]    Mencari buku yang terdaftar pada sistem
    [Tags]    search,valid,positif
    Masukkan Keyword Valid
    Klik Tombol Search
    Periksa Valid Search
Urutkan dari terkecil ke terbesar
    [Documentation]    Menyortir harga dari terendah ke tertinggi dengan 9 data sample
    [Tags]    search,sortir,low,valid,positif
    Periksa Tombol Dropdown Sort
    Klik Price, low to high
    Check Sorting Low to High
Urutkan dari terbesar ke terkecil
    [Documentation]    Menyortir harga dari tertinggi ke terendah dengan 7 data sample
    [Tags]    search,sortir,high,valid,positif
    Periksa Tombol Dropdown Sort
    Klik Price, high to low
    Check Sorting High to Low
