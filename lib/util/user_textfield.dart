import 'package:flutter/material.dart';

class UserTextfiled extends StatelessWidget {
  const UserTextfiled({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 75,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.grey[600],
          ),
        ),
        textAlign: TextAlign.center,
        maxLines: null,
        minLines: null,
        expands: true,
      ),
    );
  }
}
