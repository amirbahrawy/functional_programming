import 'functions.dart';

class Implementation {
  List<int> data = [2, 1, 3, 6, 9, 10, 11, 13, 18];
  void call() async {
    print(
        'Not make pipeline  for all data because collection is optimal and smart');
    data
        .map(addOne)
        .map(square)
        .map(subtractTen)
        .where((element) => element > 5)
        .take(2)
        .forEach(print);
    print('=======================');
    print(
        'It will not return all data directly it will return one by one and thats collection work');
    final fetchData = oneByOne();
    await for (int i in fetchData) {
      print(i);
    }
  }

  Stream<int> oneByOne() async* {
    for (int item in data) {
      yield item;
    }
  }
}
