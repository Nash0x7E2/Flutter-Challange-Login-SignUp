import 'package:flutter/material.dart';

class OutlineButtonCustom extends StatelessWidget {
  const OutlineButtonCustom({
    Key key,
    @required this.buttonText,
    @required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.white),
        ),
        width: 150.0,
        height: 35.0,
        child: Center(
          child: Text(
            buttonText.toUpperCase(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
