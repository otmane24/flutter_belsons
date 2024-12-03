import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const SecondaryButton({required this.onTap, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.green, width: 1.5),
          color: Colors.white,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
