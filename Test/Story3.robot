*** Settings ***
Documentation    Wishlist
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../Resources/Main.robot
Resource    ../Resources/Step3.robot

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
Membuat wishlist pertama kali
    [Documentation]    Membuat wishlist pertama kali
    [Tags]    wishlist,valid,positif
    Tekan Tombol Wishlist
    Periksa pernah membuat wishlist atau belum
    Membuat wishlist
    Periksa wishlist berhasil dibuat(${wishlist_pertama})
Membuat wishlist yang sudah ada
    [Documentation]    Membuat wishlist yang sudah pernah dibuat
    [Tags]    wishlist,invalid,negatif
    Periksa pernah membuat wishlist atau belum
    Membuat wishlist
    Periksa wishlist sudah ada
Membuat wishlist yang belum ada
    [Documentation]    Membuat wishlist yang belum ada
    [Tags]    wishlist,valid,positif
    Membuat wishlist yang belum ada
    Periksa wishlist berhasil dibuat(${wishlist_kedua})
Menambah barang ke wishlist
    [Documentation]    Menambahkan barang ke wishlist
    [Tags]    wishlist,valid,positif
    Tekan Bestseller
    Pilih barang
    Tekan tombol Add to Wishlist
    Pilih wishlist
    Periksa barang berhasil ditambahkan