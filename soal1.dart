class Node<T> {
  T? nodeValue; // Menyimpan data
  Node<T>? next; // Menunjuk ke node berikutnya

  // Konstruktor default
  Node() {
    nodeValue = null;
    next = null;
  }

  // Konstruktor dengan nilai
  Node.withValue(T item) {
    nodeValue = item;
    next = null;
  }
}

// Kelas SingleLinkedList
class SingleLinkedList<T> {
  Node<T>? head; // Menunjuk ke node pertama

  // Menambahkan node ke akhir list
  void append(T value) {
    var newNode = Node<T>.withValue(value);
    if (head == null) {
      head = newNode;
    } else {
      var current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  // Menampilkan semua nilai dalam linked list
  void printList() {
    var current = head;
    while (current != null) {
      print(current.nodeValue);
      current = current.next;
    }
  }

  // Menghapus node pertama dengan nilai tertentu
  void delete(T value) {
    if (head == null) return;

    if (head!.nodeValue == value) {
      head = head!.next;
      return;
    }

    var current = head;
    while (current!.next != null && current.next!.nodeValue != value) {
      current = current.next;
    }

    if (current.next != null) {
      current.next = current.next!.next;
    }
  }

  // Mencari apakah sebuah nilai ada dalam list
  bool contains(T value) {
    var current = head;
    while (current != null) {
      if (current.nodeValue == value) {
        return true;
      }
      current = current.next;
    }
    return false;
  }
}
