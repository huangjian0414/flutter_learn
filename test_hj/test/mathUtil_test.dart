

import 'package:flutter_test/flutter_test.dart';
import 'package:test_hj/Utils/mathUtil.dart';

void main (){

  group('mathUtil test', (){
    test("math utils file sum test", () {
      final result = sum(10, 20);
      expect(result, 30);
    });

    test("math utils file mul test", () {
      final result = mul(50, 30);
      expect(result, 600);
    });

  });


}