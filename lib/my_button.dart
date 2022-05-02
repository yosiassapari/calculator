import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? child;
  final Color? color;
  final Color? textColor;
  final Function() function;

  const MyButton({
    Key? key,
    required this.child,
    required this.color,
    required this.textColor,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                child!,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
