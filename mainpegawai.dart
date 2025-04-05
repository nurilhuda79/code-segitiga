import 'dart:io';
import 'pegawai.dart';

void main() {
  List<Pegawai> daftarPegawai = [
    Pegawai(nip: 101, nama: 'Ayu', alamat: 'Banyuwangi', golongan: 'A'),
    Pegawai(nip: 102, nama: 'Budi', alamat: 'Jember', golongan: 'B'),
    Pegawai(nip: 103, nama: 'Caca', alamat: 'Bondowoso', golongan: 'C'),
    Pegawai(nip: 104, nama: 'Dedi', alamat: 'Situbondo', golongan: 'B'),
    Pegawai(nip: 105, nama: 'Eka', alamat: 'Malang', golongan: 'A'),
  ];

  print('=== PROGRAM PENCARIAN DATA PEGAWAI ===');
  print('1. Sequential Search');
  print('2. Binary Search');
  stdout.write('Pilih metode pencarian (1/2): ');
  var metode = stdin.readLineSync();

  print('\nCari berdasarkan:');
  print('a. NIP');
  print('b. Nama');
  stdout.write('Pilihan (a/b): ');
  var kunci = stdin.readLineSync();

  Pegawai? hasil;

  if (metode == '1') {
    if (kunci == 'a') {
      stdout.write('Masukkan NIP: ');
      int nip = int.parse(stdin.readLineSync()!);
      hasil = sequentialSearchByNIP(daftarPegawai, nip);
    } else if (kunci == 'b') {
      stdout.write('Masukkan Nama: ');
      String nama = stdin.readLineSync()!;
      hasil = sequentialSearchByNama(daftarPegawai, nama);
    }
  } else if (metode == '2') {
    if (kunci == 'a') {
      daftarPegawai.sort((a, b) => a.nip.compareTo(b.nip));
      stdout.write('Masukkan NIP: ');
      int nip = int.parse(stdin.readLineSync()!);
      hasil = binarySearchByNIP(daftarPegawai, nip);
    } else if (kunci == 'b') {
      daftarPegawai.sort((a, b) => a.nama.toLowerCase().compareTo(b.nama.toLowerCase()));
      stdout.write('Masukkan Nama: ');
      String nama = stdin.readLineSync()!;
      hasil = binarySearchByNama(daftarPegawai, nama);
    }
  }

  print('\n=== HASIL PENCARIAN ===');
  if (hasil != null) {
    hasil.tampilkanData();
  } else {
    print('Data tidak ditemukan.');
  }
}
