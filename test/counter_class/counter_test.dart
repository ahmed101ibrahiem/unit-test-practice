

import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/counter_class/counter.dart';

void main(){
  Counter obj = Counter();

  group('check All counter cases class', () {
    test('increment method', (){
      obj.incrementCounter();
      expect(obj.counter, 1);
    });

    test('decrement method', () {
      obj.decrementCounter();
      expect(obj.counter, 0);
    });
  });


}