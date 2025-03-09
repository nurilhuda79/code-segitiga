import 'dart:io';

// Fungsi rekursif untuk menghitung nilai dalam segitiga Pascal
int pascal(int row, int col) {
  if (col == 0 || col == row) {
    return 1;
  }
  return pascal(row - 1, col - 1) + pascal(row - 1, col);
}

// Fungsi untuk mencetak segitiga Pascal hingga baris ke-n
void printPascal(int n) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j <= i; j++) {
      stdout.write("${pascal(i, j)} ");
    }
    print("");
  }
}

void main() {
  int n = 6; // Jumlah baris yang ingin ditampilkan
  printPascal(n);
}
