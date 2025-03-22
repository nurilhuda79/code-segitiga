import 'dart:io';
import 'dart:math';

class Sorting {
  static void insertionSort(List<int> arr, bool ascending) {
    for (int i = 1; i < arr.length; i++) {
      int key = arr[i];
      int j = i - 1;
      while (j >= 0 && (ascending ? arr[j] > key : arr[j] < key)) {
        arr[j + 1] = arr[j];
        j--;
      }
      arr[j + 1] = key;
    }
  }

  static void selectionSort(List<int> arr, bool ascending) {
    for (int i = 0; i < arr.length - 1; i++) {
      int minOrMaxIndex = i;
      for (int j = i + 1; j < arr.length; j++) {
        if (ascending ? arr[j] < arr[minOrMaxIndex] : arr[j] > arr[minOrMaxIndex]) {
          minOrMaxIndex = j;
        }
      }
      _swap(arr, i, minOrMaxIndex);
    }
  }

  static void bubbleSort(List<int> arr, bool ascending) {
    for (int i = 0; i < arr.length - 1; i++) {
      for (int j = 0; j < arr.length - i - 1; j++) {
        if (ascending ? arr[j] > arr[j + 1] : arr[j] < arr[j + 1]) {
          _swap(arr, j, j + 1);
        }
      }
    }
  }

  static void shellSort(List<int> arr, bool ascending) {
    int n = arr.length;
    for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
      for (int i = gap; i < n; i++) {
        int temp = arr[i];
        int j;
        for (j = i; j >= gap && (ascending ? arr[j - gap] > temp : arr[j - gap] < temp); j -= gap) {
          arr[j] = arr[j - gap];
        }
        arr[j] = temp;
      }
    }
  }

  static void quickSort(List<int> arr, int low, int high, bool ascending) {
    if (low < high) {
      int pi = partition(arr, low, high, ascending);
      quickSort(arr, low, pi - 1, ascending);
      quickSort(arr, pi + 1, high, ascending);
    }
  }

  static int partition(List<int> arr, int low, int high, bool ascending) {
    int pivot = arr[high];
    int i = low - 1;
    for (int j = low; j < high; j++) {
      if (ascending ? arr[j] < pivot : arr[j] > pivot) {
        i++;
        _swap(arr, i, j);
      }
    }
    _swap(arr, i + 1, high);
    return i + 1;
  }

  static void mergeSort(List<int> arr, bool ascending) {
    if (arr.length > 1) {
      int mid = arr.length ~/ 2;
      List<int> left = arr.sublist(0, mid);
      List<int> right = arr.sublist(mid);
      
      mergeSort(left, ascending);
      mergeSort(right, ascending);
      
      _merge(arr, left, right, ascending);
    }
  }

  static void _merge(List<int> arr, List<int> left, List<int> right, bool ascending) {
    int i = 0, j = 0, k = 0;
    while (i < left.length && j < right.length) {
      if (ascending ? left[i] < right[j] : left[i] > right[j]) {
        arr[k++] = left[i++];
      } else {
        arr[k++] = right[j++];
      }
    }
    while (i < left.length) arr[k++] = left[i++];
    while (j < right.length) arr[k++] = right[j++];
  }

  static void _swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}

void main() {
  List<int> data = List.generate(100, (index) => Random().nextInt(1000));
  print("ALGORITMA SORTING");
  print("1. Insertion");
  print("2. Selection");
  print("3. Bubble");
  print("4. Shell");
  print("5. Quick");
  print("6. Merge");
  stdout.write("Pilihan: ");
  int pilihan = int.parse(stdin.readLineSync()!);

  print("1. Ascending");
  print("2. Descending");
  stdout.write("Pilihan: ");
  bool ascending = int.parse(stdin.readLineSync()!) == 1;

  print("\nData sebelum diurutkan:");
  print(data);

  DateTime startTime = DateTime.now();

  switch (pilihan) {
    case 1:
      Sorting.insertionSort(data, ascending);
      break;
    case 2:
      Sorting.selectionSort(data, ascending);
      break;
    case 3:
      Sorting.bubbleSort(data, ascending);
      break;
    case 4:
      Sorting.shellSort(data, ascending);
      break;
    case 5:
      Sorting.quickSort(data, 0, data.length - 1, ascending);
      break;
    case 6:
      Sorting.mergeSort(data, ascending);
      break;
    default:
      print("Pilihan tidak valid!");
      return;
  }

  Duration elapsedTime = DateTime.now().difference(startTime);

  print("\nData setelah diurutkan:");
  print(data);
  print("\nWaktu: ${elapsedTime.inMilliseconds} ms");
}
