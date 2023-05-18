// Closure as the inner function close over tax and basic salary
// because there are many people have the same basic salary why calculate tax every time so we make closure
//to prevent bugs (if we pass basic salary every time )
//make function to save state (basic salary,tax) inside it
double Function(double) grossSalaryCalculator(double basicSalary) {
  final tax = 0.2 * basicSalary;
  return (double bonus) {
    return bonus + tax + basicSalary;
  };
}
