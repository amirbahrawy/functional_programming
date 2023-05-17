import 'functions.dart';

class Implementation {
  void call() {
    InvoicingPath invoicePath = InvoicingPath();
    AvailabilityPath availabilityPath = AvailabilityPath();
    Tuple<Order, ProcessConfiguration> t = setConfiguration();

    double Function(Order) costOfOrder =
        calcAdjustedCostOfOrder(t.value, invoicePath, availabilityPath);

    print(costOfOrder(t.key));
  }
}
