import 'functions.dart';

class Implementation {
  List<Order> ordersForProcessing = [
    Order(discount: 5.0),
    Order(discount: 10.0),
    Order(discount: 15.0),
    Order(discount: 20.0),
    Order(discount: 25.0),
    Order(discount: 30.0),
    Order(discount: 35.0),
    Order(discount: 40.0),
    Order(discount: 45.0),
    Order(discount: 50.0),
    Order(discount: 55.0),
  ];
  void call() {
    ordersForProcessing
        .map((order) => getOrderWithDiscount(order, getDiscountRules()))
        .forEach((order) => print(order.discount));
  }
}
