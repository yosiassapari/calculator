import 'package:flutter/material.dart';

class NeuButton extends StatelessWidget {
  final String? child;
  final Color? color;
  final Color? textColor;
  final Function() function;

  const NeuButton({
    required this.child,
    required this.color,
    required this.textColor,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              // darker shadow on the bottom right
              BoxShadow(
                color: Colors.deepPurple.shade700,
                offset: const Offset(4, 4),
                blurRadius: 20,
                spreadRadius: 1,
              ),

              //lighter shadow on the top left
              BoxShadow(
                color: Colors.deepPurple.shade200,
                offset: const Offset(-4, -4),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepPurple.shade200,
                  Colors.deepPurple.shade400,
                ],
                stops: const [
                  0.1,
                  0.9,
                ]),
          ),
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
    );
  }
}
