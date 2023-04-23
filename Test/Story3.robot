*** Settings ***

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
    Tekan Tombol Wishlist
    Periksa pernah membuat wishlist atau belum
    Membuat wishlist
    Periksa wishlist berhasil dibuat(${wishlist_pertama})
Membuat wishlist yang sudah ada
    Periksa pernah membuat wishlist atau belum
    Membuat wishlist
    Periksa wishlist sudah ada
Membuat wishlist yang belum ada
    Membuat wishlist yang belum ada
    Periksa wishlist berhasil dibuat(${wishlist_kedua})
Mengubah nama wishlist dengan nama yang belum ada
    Tekan tombol edit
    Masukkan nama wishlist
    Tekan tombol save
    Periksa nama wishlist berhasil diubah
# Menambah barang ke wishlist
#     Tekan Bestseller
#     Pilih barang{${barang_berbeda}}