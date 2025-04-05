class Pegawai {
  int nip;
  String nama;
  String alamat;
  String golongan;

  Pegawai({
    required this.nip,
    required this.nama,
    required this.alamat,
    required this.golongan,
  });

  void tampilkanData() {
    print('NIP      : $nip');
    print('Nama     : $nama');
    print('Alamat   : $alamat');
    print('Golongan : $golongan');
  }
}

// Sequential Search by NIP
Pegawai? sequentialSearchByNIP(List<Pegawai> daftar, int nipDicari) {
  for (var pegawai in daftar) {
    if (pegawai.nip == nipDicari) {
      return pegawai;
    }
  }
  return null;
}

// Sequential Search by Nama
Pegawai? sequentialSearchByNama(List<Pegawai> daftar, String namaDicari) {
  for (var pegawai in daftar) {
    if (pegawai.nama.toLowerCase() == namaDicari.toLowerCase()) {
      return pegawai;
    }
  }
  return null;
}

// Binary Search by NIP
Pegawai? binarySearchByNIP(List<Pegawai> daftar, int nipDicari) {
  int low = 0;
  int high = daftar.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    if (daftar[mid].nip == nipDicari) {
      return daftar[mid];
    } else if (daftar[mid].nip < nipDicari) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return null;
}

// Binary Search by Nama
Pegawai? binarySearchByNama(List<Pegawai> daftar, String namaDicari) {
  int low = 0;
  int high = daftar.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    int cmp = daftar[mid].nama.toLowerCase().compareTo(namaDicari.toLowerCase());

    if (cmp == 0) {
      return daftar[mid];
    } else if (cmp < 0) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return null;
}
