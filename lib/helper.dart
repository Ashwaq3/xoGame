extension ContainsAllIndices on List{
  bool containsAll(int index1, int index2, [index3]){
    return index3 == null? contains(index1) && contains(index2) : (index1 == index2) && (index2 == index3);
  }
}