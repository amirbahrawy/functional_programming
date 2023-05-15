import 'functions.dart';

class Lesson3 {
  List<Function> list = [test1, test2];
  void call() {
    print(test2(test1(5.0)));
    print(test1(test2(5.0)));
    print(list[0](5.0));
    print(list[1](5.0));
    print(test3(test1, 5.0));
    print(test3(test2, 5.0));
  }
}
