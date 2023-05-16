import 'functions.dart';

// How to make a pipeline of functions in dart
class Implementation {
  List<double> data = [7, 4, 5, 6, 3, 8, 10];

  void call() {
    //using declarative style
    print('Declarative style');
    data.map(addOne).map(square).map(subtractTen).forEach(print);
    //to avoid the creation of intermediate lists
    print('Declarative style without intermediate lists');
    data.map((x) => subtractTen(square(addOne(x)))).forEach(print);
    //using composition
    print('Using composition');
    data.map(addOneSquareSubtractTen()).forEach(print);
  }
}
