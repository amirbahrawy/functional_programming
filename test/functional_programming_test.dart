import 'package:test/test.dart';

import '../bin/functions.dart';

void main() {
  test('add one', () {
    expect(addOne(41), 42);
  });
  test('subtract ten', () {
    expect(subtractTen(41), 31);
  });
  test('square', () {
    expect(square(5), 25);
  });
}
