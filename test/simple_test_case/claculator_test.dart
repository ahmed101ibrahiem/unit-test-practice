
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/calculator_class/calculator.dart';

void main(){
  test('return sum of two number is 13, if num1 = 5 and num2 = 8', () {
    // AAA
    // arrange
    final Calculator calc = Calculator();
    int num1 = 5;
    int num2 = 8;
    int expResult = 13;
    // act
    int result = calc.add(num1, num2);

    // assert
    expect(result, expResult);
  });
  test('DividedBy method should 2 if the input 10 and 5 ', ()
  {
    // arrange
    Calculator calc = Calculator();
    int num1 = 10;
    int num2 = 5;
    int expResult = 2;
    // act
    int result = calc.divideBy(num1, num2);
    // assert
    expect(result, expResult);
  });

  test('Divide method should throw an exception if num2 = 0', () {
    // arrange
    Calculator calc = Calculator();
    int num1 = 5;
    int num2 = 0;
    final expResult = throwsA(isA<Exception>());
    // act
    result()=> calc.divideBy(num1, num2);
    // assert
    expect(result, expResult);
  });
}