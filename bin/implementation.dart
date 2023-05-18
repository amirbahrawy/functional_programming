import 'functions.dart';

class Implementation {
  Map<String, double> basicSalaries = {
    "a": 1000,
    "b": 2000,
    "c": 3000,
    "d": 4000,
    "e": 5000
  };

  void call() {
    final grossSalaryCalculators = basicSalaries.map((key, value) => MapEntry(
          key,
          grossSalaryCalculator(value),
        ));

    // Convert values to a list
    print(grossSalaryCalculators["a"]!(80.0));
    print(grossSalaryCalculators["b"]!(80.0));
    print(grossSalaryCalculators["c"]!(80.0));
  }
}
