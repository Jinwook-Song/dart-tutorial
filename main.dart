void main() {
  print(reverseList([1, 2, 3, 4]));
}

typedef ListOfInts = List<int>;

ListOfInts reverseList(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
}
