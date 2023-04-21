*** Settings ***
Documentation    Search Data
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
    Tekan Tombol Keranjang
    Cek keranjang kosong
Menambahkan barang ke Keranjang
    Tekan Bestseller
    Tekan Tombol Add to Basket
    Periksa muncul modal dialog
    Periksa barang masuk keranjang
Menghapus barang
    Hapus barang
    Cek keranjang kosong
Menambahkan barang yang sama ke Keranjang
    Tekan Bestseller
    Add to Basket barang yang sama
    Periksa apakah jumlah yang ditambahkan sesuai
    Hapus barang
    Cek keranjang kosong
Menambahkan barang yang berbeda ke keranjang
    Tekan Bestseller
    Add to Basket barang yang berbeda
    Periksa buku yang ditambahkan ke keranjang
Menambah jumlah barang di keranjang
    Tambah jumlah barang
    Periksa tambah jumlah barang
Kurangi jumlah barang di keranjang
    Kurangi jumlah barang
    Periksa kurang jumlah barang
Periksa total jumlah barang pada keranjang
    Kalkulasi semua jumlah barang
    Periksa kalkulasi dengan total jumlah barang keranjang
Periksa total jumlah harga keranjang
    Kalkulasi semua harga barang
    Periksa kalkulasi dengan total harga keranjang
Mengosongkan keranjang
    Tekan tombol remove barang
    Cek keranjang kosong
