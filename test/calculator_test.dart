import 'package:flutter_test/flutter_test.dart';
import 'package:test_example/calculator.dart';

void main() {
  group("Calculator", () {
    test("Add Feature Test", () {
      final calculator = Calculator();
      final result = calculator.add(10, 20);
      expect(result, 30);
    });

    test("Subtract Feature Test", () {
      final calculator = Calculator();
      final result = calculator.subract(100, 20);
      expect(result, 80);
    });

    test("Multiplication Feature Test", () {
      final calculator = Calculator();
      final result = calculator.multiply(100, 20);
      expect(result, 2000);
    });
  });
}
