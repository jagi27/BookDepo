*** Settings ***
Documentation    Keranjang
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../Resources/Main.robot
Resource    ../Resources/Step2.robot

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
Cek Keranjang
    [Documentation]    Periksa Keranjang
    [Tags]    keranjang,valid,positif
    Tekan Tombol Keranjang
    Cek keranjang kosong
Menambahkan barang ke Keranjang
    [Documentation]    Tambah barang ke keranjang
    [Tags]    keranjang,valid,positif
    Tekan Bestseller
    Tekan Tombol Add to Basket
    Periksa muncul modal dialog
    Periksa barang masuk keranjang
Menghapus barang
    [Documentation]    Hapus barang
    [Tags]    keranjang,valid,positif
    Hapus barang
    Cek keranjang kosong
Menambahkan barang yang sama ke Keranjang
    [Documentation]    Tambah barang yang sama
    [Tags]    keranjang,valid,positif
    Tekan Bestseller
    Add to Basket barang yang sama
    Periksa apakah jumlah yang ditambahkan sesuai
    Hapus barang
    Cek keranjang kosong
Menambahkan barang yang berbeda ke keranjang
    [Documentation]    Tambah barang berbeda
    [Tags]    keranjang,valid,positif
    Tekan Bestseller
    Add to Basket barang yang berbeda
    Periksa buku yang ditambahkan ke keranjang
Menambah jumlah barang di keranjang
    [Documentation]    Tambah quantity barang
    [Tags]    keranjang,valid,positif
    Tambah jumlah barang
    Periksa tambah jumlah barang
Kurangi jumlah barang di keranjang
    [Documentation]    Kurang quanity barang
    [Tags]    keranjang,valid,positif
    Kurangi jumlah barang
    Periksa kurang jumlah barang
Periksa total jumlah barang pada keranjang
    [Documentation]    Cek total jumlah barang
    [Tags]    keranjang,valid,positif
    Kalkulasi semua jumlah barang
    Periksa kalkulasi dengan total jumlah barang keranjang
Periksa total jumlah harga keranjang
    [Documentation]    Cek total jumlah harga
    [Tags]    keranjang,valid,positif
    Kalkulasi semua harga barang
    Periksa kalkulasi dengan total harga keranjang
