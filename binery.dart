// Fungsi rekursif untuk melakukan binary search
int binarySearch(List<int> arr, int target, int left, int right) {
  if (left > right) {
    return -1; // Tidak ditemukan
  }

  int mid = (left + right) ~/ 2;

  if (arr[mid] == target) {
    return mid; // Elemen ditemukan
  } else if (arr[mid] > target) {
    return binarySearch(arr, target, left, mid - 1); // Cari di kiri
  } else {
    return binarySearch(arr, target, mid + 1, right); // Cari di kanan
  }
}

void main() {
  List<int> data = [2, 5, 8, 10, 14, 32, 35, 41, 67, 88, 90, 101, 109];
  int target = 10;

  int index = binarySearch(data, target, 0, data.length - 1);

  if (index != -1) {
    print("Data $target berada pada indeks ke-$index");
  } else {
    print("Data $target tidak ditemukan");
  }
}
