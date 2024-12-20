import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
  });

  final Function(String)? onChanged;
  final String? hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: TextFormField(
        obscureText: obscureText,
        validator: (data) {
          if (data!.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.04,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(size.width * 0.03),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(size.width * 0.03),
          ),
        ),
      ),
    );
  }
}
