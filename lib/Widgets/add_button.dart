import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.windowHeight,
    required this.windowWidth,
    required this.onPressed,
  }) : super(key: key);

  final double windowHeight;
  final double windowWidth;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function(),
      child: Container(
        height: windowHeight * 0.04,
        width: windowWidth * 0.2,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'Add',
            style: TextStyle(
              fontSize: windowHeight * 0.02,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
