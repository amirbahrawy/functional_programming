// ignore_for_file: public_member_api_docs, sort_constructors_first

double test1(double x) {
  return x / 2;
}

double test2(double x) {
  return x / 4 + 1;
}

double test3(Function f, double value) {
  return f(value) + value;
}
double calculateDiscount(
  (double, double) Function(int) productParameter,
// MapEntry Function(int) productParameter,
  Order order,
) {
  final parameters = productParameter(order.index);
  // return parameters.key * order.quantity + parameters.value * order.unitPrice;
  return parameters.$1 * order.quantity + parameters.$2 * order.unitPrice;
}

(double, double) productParameterFood(int productIndex) {
  return (
    productIndex / (productIndex + 100.0),
    productIndex / (productIndex + 300.0)
  );
// MapEntry productParametersFood(int productIndex) {
//  return MapEntry(productIndex / (productIndex + 100.0),
//  productIndex / (productIndex + 300.0));
}

(double, double) productParametersBeverage(int productIndex) {
  return (
    productIndex / (productIndex + 300.0),
    productIndex / (productIndex + 400.0)
  );
}

//  MapEntry productParametersBeverage(int productIndex) {
//  return MapEntry(productIndex / (productIndex + 300.0),
//  productIndex / (productIndex + 400.0));
// }
(double, double) productParametersRawMaterial(int productIndex) {
  return (
    productIndex / (productIndex + 400.0),
    productIndex / (productIndex + 700.0)
  );
}
//   MapEntry productParametersRawMaterial(int productIndex) {
//  return MapEntry(productIndex / (productIndex + 400.0),
//  productIndex / (productIndex + 700.0));
// }

class Order {
  int id;
  int index;
  int quantity;
  int unitPrice;
  Order({
    required this.id,
    required this.index,
    required this.quantity,
    required this.unitPrice,
  });
}

enum ProductType {
  food,
  beverage,
  rawMaterial,
}
