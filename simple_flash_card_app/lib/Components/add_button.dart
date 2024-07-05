import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddButton({Key? key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      shape: CircleBorder(),
      backgroundColor: Colors.white,
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}