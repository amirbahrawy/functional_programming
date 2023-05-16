// ignore_for_file: public_member_api_docs, sort_constructors_first
typedef Tuple<A, B> = MapEntry<A, B>;

bool isAQualified(Order r) {
  return true;
}

double A(Order r) {
  return 2.0;
}

bool isBQualified(Order r) {
  return true;
}

double B(Order r) {
  return 5.0;
}

bool isCQualified(Order r) {
  return true;
}

double C(Order r) {
  return 3.0;
}

double average(List<double> list) {
  return list.reduce((a, b) => a + b) / list.length;
}

List<Tuple<bool Function(Order), double Function(Order)>> getDiscountRules() {
  final discountRules = [
    Tuple<bool Function(Order), double Function(Order)>(
      isAQualified,
      A,
    ),
    Tuple<bool Function(Order), double Function(Order)>(
      isBQualified,
      B,
    ),
    Tuple<bool Function(Order), double Function(Order)>(
      isCQualified,
      C,
    ),
  ];

  return discountRules;
}

Order getOrderWithDiscount(
  Order r,
  List<Tuple<bool Function(Order), double Function(Order)>> rules,
) {
  //key: bool Function(Order) QualifyingCondition, value: double Function(Order) GetDiscount
  final discount =
      average(rules.where((rule) => rule.key(r)).map((a) => a.value(r)).toList()
        ..sort()
        ..take(3));
  var newOrder = Order();
  newOrder.discount = discount;
  return newOrder;
}

class Order {
  double discount;
  Order({this.discount = 1.0});
}
