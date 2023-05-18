import 'functions.dart';

class Implementation {
  List<int> data = [2, 1, 3, 6, 9, 10, 11, 13, 18];
  void call() {
    print(
        'Not make pipeline  for all data because collection is optimal and smart');
    data
        .map(addOne)
        .map(square)
        .map(subtractTen)
        .where((element) => element > 5)
        .take(2)
        .forEach(print);
  }
}
