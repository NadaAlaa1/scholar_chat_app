import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap, required this.buttonText});

  final VoidCallback? onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.width * 0.02),
          ),
          height: size.height * 0.08,
          width: double.infinity,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: size.width * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
