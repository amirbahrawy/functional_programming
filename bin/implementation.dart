import 'functions.dart';

class Implementation {
  List<Function> list = [test1, test2];
  void call() {
    //invoke method normally
    print(test2(test1(5.0)));
    print(test1(test2(5.0)));
    //invoke methods using delegation
    print(list[0](5.0));
    print(list[1](5.0));
    //invoke methods using higher order functions
    print(test3(test1, 5.0));
    print(test3(test2, 5.0));

    //Make discount function using higher order functions
    print("==================================");
    print('Discount Method');
   (double,double) Function(int) a = productParametersFood;
   (double,double) Function(int) b = productParametersBeverage;
    (double,double) Function(int) c = productParametersRawMaterial;
    Order r = Order(
      id: 10,
      index: 100,
      quantity: 20,
      unitPrice: 4,
    );
    final productType = ProductType.food;
    (double,double) Function(int) productParameter =
        (productType == ProductType.food)
            ? a
            : (productType == ProductType.beverage)
                ? b
                : c;
    print(calculateDiscount(productParameter, r));
  }
}
