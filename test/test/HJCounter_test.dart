


import 'package:flutter_test/flutter_test.dart';
import 'package:test/Utils/HJCounter.dart';

void main(){
  
  // test('HJCounter class test', (){
  //
  //   final counter = HJCounter();
  //   counter.increment();
  //
  //   /// 通过expect来监测结果正确与否
  //   expect(counter.value, 1);
  //
  // });


  /// 整合多个测试
  group('HJCounter test', (){

    test('HJCounter default value', (){

      /// 通过expect来监测结果正确与否
      expect(HJCounter().value, 0);

    });
    test('HJCounter increment', (){

      final counter = HJCounter();
      counter.increment();

      /// 通过expect来监测结果正确与否
      expect(counter.value, 1);

    });

    test('HJCounter decrement', (){

      final counter = HJCounter();
      counter.decrement();

      /// 通过expect来监测结果正确与否
      expect(counter.value, -1);

    });

  });

}