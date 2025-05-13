import 'soal1.dart';

void main() {
  var list = SingleLinkedList<int>();

  list.append(10);
  list.append(20);
  list.append(30);

  print("Isi Linked List:");
  list.printList();

  print("Apakah mengandung 20? ${list.contains(20)}");

  list.delete(20);
  print("Setelah menghapus 20:");
  list.printList();
}
