import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key key,
      @required this.child,
      @required this.onPressed,
      this.color,
      this.radius})
      : super(key: key);
  final Function onPressed;
  final radius;
  final color;
  final child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: child ?? Text('Button'),
        
        style: ButtonStyle(
          
            backgroundColor: MaterialStateProperty.all(color) ??
                MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 0),
              // side: BorderSide(color: Colors.red)
            ))));
  }
}
