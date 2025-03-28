

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HJRatingStar extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  final Widget unselectedImage;
  final Widget selectedImage;

  HJRatingStar({
  required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget? unselectedImage,
    Widget? selectedImage,
  }): unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unselectedColor, size: size,),
  selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size,);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HJRatingStarState();
  }
}

class _HJRatingStarState extends State<HJRatingStar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Row(children: buildUnselectedStar(),mainAxisSize: MainAxisSize.min,),
        Row(children: buildSelectedStar(),mainAxisSize: MainAxisSize.min,)
      ],
    );
  }

  List<Widget> buildUnselectedStar(){
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }
  List<Widget> buildSelectedStar(){
    List<Widget> stars = [];
    final star = widget.selectedImage;

    /// 满填充的star
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();

    for (var i = 0; i < entireCount; i++){
      stars.add(star);
    }

    /// 部分填充的star
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final halfStar = ClipRect(
      child: star,
      clipper: HJStarClipper(leftWidth),
      );
    stars.add(halfStar);

    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }

    return stars;
  }
}

class HJStarClipper extends CustomClipper<Rect>{
  double width;

  HJStarClipper(this.width);
  
  @override
  bool shouldReclip(HJStarClipper oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper.width != this.width;
  }

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

}