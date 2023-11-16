import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Color color;
  final double radius;
  final double fontSize;
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    required this.text,
    required this.color,
    required this.radius,
    required this.fontSize,
    required this.icon,
    this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        primary: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        textStyle: TextStyle(
          fontSize: widget.fontSize,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          Text(
            widget.text,
            style: TextStyle(
                fontSize: widget.fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Icon(widget.icon),
        ],
      ),
    );
  }
}
