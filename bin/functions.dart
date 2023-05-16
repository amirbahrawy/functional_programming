double addOne(double x) {
  return x + 1.0;
}

double subtractTen(double x) {
  return x - 10;
}

double square(double x) {
  return x * x;
}

double Function(double) addOneSquareSubtractTen() {
  return addOne.compose(square).compose(subtractTen);
}

extension Compose on Function {
  T3 Function(T1) compose<T1, T2, T3>(T3 Function(T2) g) => (x) => g(this(x));
}
