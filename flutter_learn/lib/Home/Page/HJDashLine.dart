

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HJDashLine extends StatelessWidget {

  final Axis axis;
  final double dashWidth;
  final double dashHeight;
  final int count;
  final Color color;

  HJDashLine({
    this.axis = Axis.horizontal,
    this.dashWidth = 1,
    this.dashHeight = 1,
    this.count = 10,
    this.color = Colors.grey
  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (_) {
        return SizedBox(
          width: dashWidth,
          height: dashHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        );
      }),
    );
  }
}
