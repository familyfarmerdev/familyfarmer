import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  final bool isVisible;

  CustomLoading({this.isVisible = false});

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: ClipRRect(
         // borderRadius: BorderRadius.circular(60.0), // You can adjust the radius as needed
          child: SizedBox(
            width: 300,
            height: 200,
            child: Image.asset(
              'assets/images/loading.gif', // Replace 'loading.gif' with your GIF file path

            ),
          ),
        ),
      ),
    )
        : SizedBox.shrink();
  }
}
