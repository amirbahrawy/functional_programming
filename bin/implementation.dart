import 'functions.dart';

// How to make a pipeline of functions in dart
class Implementation {
  List<int> data = [7, 4, 5, 6, 3, 8, 10];

  void call() {
    // Using Imperative Programming
    print('Imperative Programming');
    for (int item in data) {
      print(subtractTen(square(addOne(item))));
    }
    // Using Declarative Programming
    print('Declarative Programming');
    data.map(addOne).map(square).map(subtractTen).forEach(print);
    // if you want to to edit this function in declarative it more easy than imperative
    print('Edit in Declarative Programming');
    data.map(addOne).map(square).where((element) => element < 70).toList()
      ..sort((a, b) => a.compareTo(b))
      ..take(2).map(subtractTen).forEach(print);
  }
}
