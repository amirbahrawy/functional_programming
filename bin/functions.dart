// ignore_for_file: public_member_api_docs, sort_constructors_first
typedef InvoiceCalculationFunction = Invoice Function(Order o);
typedef ShippingCalculationFunction = Shipping Function(Invoice i);
typedef FreightCalculationFunction = Freight Function(Shipping s);
typedef AvailabilityCalculationFunction = Availability Function(Order o);
typedef ShippingDateCalculationFunction = ShippingDate Function(Availability a);
typedef InvoicePathReturnFunction = Freight Function(Order o);
typedef AvailabilityPathReturnFunction = ShippingDate Function(Order o);
typedef Tuple<T1, T2> = MapEntry<T1, T2>;

// if want another type of Process Configuration or Order, just change the data here
Tuple<Order, ProcessConfiguration> setConfiguration() {
  ProcessConfiguration processConfiguration = ProcessConfiguration();
  Customer customer = Customer();
  Order order = Order();
  processConfiguration.invoiceChoice = InvoiceChoice.Inv3;
  processConfiguration.shippingChoice = ShippingChoice.Sh2;
  processConfiguration.freightChoice = FreightChoice.fr3;
  processConfiguration.availabilityChoice = AvailabilityChoice.AV2;
  processConfiguration.shippingDateChoice = ShippingDateChoice.SD2;
  order.customer = customer;
  order.date = DateTime(2021, 3, 30);
  order.cost = 2000;
  return Tuple(order, processConfiguration);
}

//Adjusted Cost for Order
double Function(Order) calcAdjustedCostOfOrder(
  ProcessConfiguration c,
  InvoicingPath invoicePath,
  AvailabilityPath availabilityPath,
) {
  return (x) => adjustCost(
      x,
      invoicePathFunc(
        c,
        invoicePath,
      ),
      availabilityPathFunc(
        c,
        availabilityPath,
      ));
}

//Adjusted Cost
double adjustCost(Order r, InvoicePathReturnFunction calcFreight,
    AvailabilityPathReturnFunction calcShippingDate) {
  Freight f = calcFreight(r);
  ShippingDate s = calcShippingDate(r);
  print("\n\nDay of Shipping : ${s.date?.day.toString()} \n");

  double cost = (s.date?.day.toString() == "Monday")
      ? f.cost ?? 0 + 1000
      : f.cost ?? 0 + 500;

  ///Final Cost
  return cost;
}

InvoicePathReturnFunction invoicePathFunc(
  ProcessConfiguration c,
  InvoicingPath fpl,
) {
  InvoicePathReturnFunction p = fpl.invoiceFunctions
      .where((element) => element.key == c.invoiceChoice)
      .map((x) => x.value)
      .first
      .compose(fpl.shippingFunctions
          .where((element) => element.key == c.shippingChoice)
          .map((x) => x.value)
          .first)
      .compose(
        fpl.freightFunctions
            .where((element) => element.key == c.freightChoice)
            .map((x) => x.value)
            .first,
      );
  return p;
}

AvailabilityPathReturnFunction availabilityPathFunc(
  ProcessConfiguration c,
  AvailabilityPath fpl,
) {
  AvailabilityPathReturnFunction p = fpl.availabilityFunctions
      .where((element) => element.key == c.availabilityChoice)
      .map((x) => x.value)
      .first
      .compose(fpl.shippingDateFunctions
          .where((element) => element.key == c.shippingDateChoice)
          .map((x) => x.value)
          .first);
  return p;
}

Invoice calcInvoice1(Order o) {
  print("Invoice 1");
  Invoice invoice = Invoice();
  invoice.cost = o.cost! * 1.1;
  return invoice;
}

Invoice calcInvoice2(Order o) {
  print("Invoice 2");
  Invoice invoice = Invoice();
  invoice.cost = o.cost! * 1.2;
  return invoice;
}

Invoice calcInvoice3(Order o) {
  print("Invoice 3");
  Invoice invoice = Invoice();
  invoice.cost = o.cost! * 1.3;
  return invoice;
}

Invoice calcInvoice4(Order o) {
  print("Invoice 4");
  Invoice invoice = Invoice();
  invoice.cost = o.cost! * 1.4;
  return invoice;
}

Invoice calcInvoice5(Order o) {
  print("Invoice 5");
  Invoice invoice = Invoice();
  invoice.cost = o.cost! * 1.5;
  return invoice;
}

Shipping calcShipping1(Invoice i) {
  print("Shipping 1");
  Shipping s = Shipping();
  s.shipperID = (i.cost! > 1000) ? 1 : 2;
  s.cost = i.cost;
  return s;
}

Shipping calcShipping2(Invoice i) {
  print("Shipping 2");
  Shipping s = Shipping();
  s.shipperID = (i.cost! > 1100) ? 1 : 2;
  s.cost = i.cost;
  return s;
}

Shipping calcShipping3(Invoice i) {
  print("Shipping 3");
  Shipping s = Shipping();
  s.shipperID = (i.cost! > 1200) ? 1 : 2;
  s.cost = i.cost;
  return s;
}

Freight calcFreightCost1(Shipping s) {
  print("Freight 1");
  Freight f = Freight();
  f.cost = (s.shipperID == 1) ? s.cost! * 0.25 : s.cost! * 0.5;
  return f;
}

Freight calcFreightCost2(Shipping s) {
  print("Freight 2");
  Freight f = Freight();
  f.cost = (s.shipperID == 1) ? s.cost! * 0.28 : s.cost! * 0.52;
  return f;
}

Freight calcFreightCost3(Shipping s) {
  print("Freight 3");
  Freight f = Freight();
  f.cost = (s.shipperID == 1) ? s.cost! * 0.3 : s.cost! * 0.6;
  return f;
}

Freight calcFreightCost4(Shipping s) {
  print("Freight 4");
  Freight f = Freight();
  f.cost = (s.shipperID == 1) ? s.cost! * 0.35 : s.cost! * 0.65;
  return f;
}

Freight calcFreightCost5(Shipping s) {
  print("Freight 5");
  Freight f = Freight();
  f.cost = (s.shipperID == 1) ? s.cost! * 0.15 : s.cost! * 0.2;
  return f;
}

Freight calcFreightCost6(Shipping s) {
  print("Freight 6");
  Freight f = Freight();
  f.cost = (s.shipperID == 1) ? s.cost! * 0.1 : s.cost! * 0.15;
  return f;
}

Availability calcAvailability1(Order o) {
  print("Availability 1");
  Availability a = Availability();
  a.date = o.date!.add(Duration(days: 3));
  return a;
}

Availability calcAvailability2(Order o) {
  print("Availability 2");
  Availability a = Availability();
  a.date = o.date!.add(Duration(days: 2));
  return a;
}

Availability calcAvailability3(Order o) {
  print("Availability 3");
  Availability a = Availability();
  a.date = o.date!.add(Duration(days: 1));
  return a;
}

Availability calcAvailability4(Order o) {
  print("Availability 4");
  Availability a = Availability();
  a.date = o.date!.add(Duration(days: 4));
  return a;
}

ShippingDate calcShippingDate1(Availability o) {
  print("ShippingDate 1");
  ShippingDate a = ShippingDate();
  a.date = o.date!.add(Duration(days: 1));
  return a;
}

ShippingDate calcShippingDate2(Availability o) {
  print("ShippingDate 2");
  ShippingDate a = ShippingDate();
  a.date = o.date!.add(Duration(days: 2));
  return a;
}

ShippingDate calcShippingDate3(Availability o) {
  print("ShippingDate 3");
  ShippingDate a = ShippingDate();
  a.date = o.date!.add(Duration(hours: 14));
  return a;
}

ShippingDate calcShippingDate4(Availability o) {
  print("ShippingDate 4");
  ShippingDate a = ShippingDate();
  a.date = o.date!.add(Duration(hours: 20));
  return a;
}

ShippingDate calcShippingDate5(Availability o) {
  print("ShippingDate 5");
  ShippingDate a = ShippingDate();
  a.date = o.date!.add(Duration(hours: 10));
  return a;
}

class InvoicingPath {
  late List<Tuple<InvoiceChoice, InvoiceCalculationFunction>> invoiceFunctions;
  late List<Tuple<ShippingChoice, ShippingCalculationFunction>>
      shippingFunctions;
  late List<Tuple<FreightChoice, FreightCalculationFunction>> freightFunctions;

  InvoicingPath() {
    invoiceFunctions = [
      Tuple(InvoiceChoice.Inv1, calcInvoice1),
      Tuple(InvoiceChoice.Inv2, calcInvoice2),
      Tuple(InvoiceChoice.Inv3, calcInvoice3),
      Tuple(InvoiceChoice.Inv4, calcInvoice4),
      Tuple(InvoiceChoice.Inv5, calcInvoice5),
    ];

    shippingFunctions = [
      Tuple(ShippingChoice.Sh1, calcShipping1),
      Tuple(ShippingChoice.Sh2, calcShipping2),
      Tuple(ShippingChoice.Sh3, calcShipping3),
    ];

    freightFunctions = [
      Tuple(FreightChoice.fr1, calcFreightCost1),
      Tuple(FreightChoice.fr2, calcFreightCost2),
      Tuple(FreightChoice.fr3, calcFreightCost3),
      Tuple(FreightChoice.fr4, calcFreightCost4),
      Tuple(FreightChoice.fr5, calcFreightCost5),
      Tuple(FreightChoice.fr6, calcFreightCost6),
    ];
  }
}

class AvailabilityPath {
  late List<Tuple<AvailabilityChoice, AvailabilityCalculationFunction>>
      availabilityFunctions;
  late List<Tuple<ShippingDateChoice, ShippingDateCalculationFunction>>
      shippingDateFunctions;

  AvailabilityPath() {
    availabilityFunctions = [
      Tuple(AvailabilityChoice.AV1, calcAvailability1),
      Tuple(AvailabilityChoice.AV2, calcAvailability2),
      Tuple(AvailabilityChoice.AV3, calcAvailability3),
      Tuple(AvailabilityChoice.AV4, calcAvailability4),
    ];

    shippingDateFunctions = [
      Tuple(ShippingDateChoice.SD1, calcShippingDate1),
      Tuple(ShippingDateChoice.SD2, calcShippingDate2),
      Tuple(ShippingDateChoice.SD3, calcShippingDate3),
      Tuple(ShippingDateChoice.SD4, calcShippingDate4),
      Tuple(ShippingDateChoice.SD5, calcShippingDate5),
    ];
  }
}

class ProcessConfiguration {
  InvoiceChoice? invoiceChoice;
  ShippingChoice? shippingChoice;
  FreightChoice? freightChoice;
  AvailabilityChoice? availabilityChoice;
  ShippingDateChoice? shippingDateChoice;
}

class Customer {}

class Order {
  Customer? customer;
  DateTime? date;
  double? cost;
}

class Invoice {
  double? cost;
  Invoice() {
    cost = 0;
  }
}

class Shipping {
  double? cost;
  int? shipperID;
  Shipping() {
    cost = 0;
  }
}

class Freight {
  double? cost;
  Freight() {
    cost = 0;
  }
}

class Availability {
  DateTime? date;
}

class ShippingDate {
  DateTime? date;
}

enum InvoiceChoice { Inv1, Inv2, Inv3, Inv4, Inv5 }

enum ShippingChoice { Sh1, Sh2, Sh3 }

enum FreightChoice { fr1, fr2, fr3, fr4, fr5, fr6 }

enum AvailabilityChoice { AV1, AV2, AV3, AV4 }

enum ShippingDateChoice { SD1, SD2, SD3, SD4, SD5 }

extension Compose on Function {
  T3 Function(T1) compose<T1, T2, T3>(T3 Function(T2) g) => (x) => g(this(x));
}
