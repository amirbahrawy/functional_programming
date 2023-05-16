import 'functions.dart';

// How to make a pipeline of functions in dart
class Implementation {
  List<int> data = [7, 4, 5, 6, 3, 8, 10];

  void call() {
    data.map(addOne).map(square).map(subtractTen).forEach(print);
  }
}
