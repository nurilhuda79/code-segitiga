import 'dart:math';

void main() {
  List<num> data = List.generate(10, (index) => Random().nextInt(100));
  
  print("Data sebelum diurutkan:");
  printData(data);

  // Quick Sort Ascending
  List<num> ascendingData = List.from(data);
  DateTime startTimeAsc = DateTime.now();
  quickSort(ascendingData, 0, ascendingData.length - 1, true);
  Duration elapsedTimeAsc = DateTime.now().difference(startTimeAsc);
  
  print("\nData setelah Quick Sort Ascending:");
  printData(ascendingData);
  print('Waktu: ${elapsedTimeAsc.inMilliseconds} ms');

  // Quick Sort Descending
  List<num> descendingData = List.from(data);
  DateTime startTimeDesc = DateTime.now();
  quickSort(descendingData, 0, descendingData.length - 1, false);
  Duration elapsedTimeDesc = DateTime.now().difference(startTimeDesc);
  
  print("\nData setelah Quick Sort Descending:");
  printData(descendingData);
  print('Waktu: ${elapsedTimeDesc.inMilliseconds} ms');
}

void quickSort<T extends Comparable<T>>(List<T> arr, int p, int r, bool ascending) {
  if (p < r) {
    int q = partition(arr, p, r, ascending);
    quickSort(arr, p, q, ascending);
    quickSort(arr, q + 1, r, ascending);
  }
}

int partition<T extends Comparable<T>>(List<T> arr, int p, int r, bool ascending) {
  int i = p, j = r;
  T pivot = arr[p];

  while (i <= j) {
    while (ascending ? pivot.compareTo(arr[j]) < 0 : pivot.compareTo(arr[j]) > 0) j--;
    while (ascending ? pivot.compareTo(arr[i]) > 0 : pivot.compareTo(arr[i]) < 0) i++;
    
    if (i < j) {
      T temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      j--;
      i++;
    } else {
      return j;
    }
  }
  return j;
}

void printData<T>(List<T> data) {
  print(data.join(', '));
}
