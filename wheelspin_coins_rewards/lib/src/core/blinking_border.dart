import 'dart:async';
import 'package:flutter/material.dart';

class BlinkingBorder extends StatefulWidget {
  final Widget child;

  BlinkingBorder({required this.child});

  @override
  _BlinkingBorderState createState() => _BlinkingBorderState();
}

class _BlinkingBorderState extends State<BlinkingBorder> {
  late bool _showBorder;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _showBorder = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _showBorder = !_showBorder;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: _showBorder
            ? Border.all(
                color: Colors.red, // Border color
                width: 2.0, // Border width
              )
            : null, // No border when blinking is off
      ),
      child: widget.child,
    );
  }
}
