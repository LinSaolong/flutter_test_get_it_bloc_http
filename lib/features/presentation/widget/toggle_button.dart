import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final bool selected;
  final String text;
  final Function onChange;
  final double width;

  ToggleButton({
    this.selected,
    this.onChange,
    this.width = 120,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 200),
      crossFadeState:
          selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Container(
        width: width,
        height: 40,
        child: RaisedButton(
          color: Colors.greenAccent,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            onChange(false);
          },
        ),
      ),
      secondChild: Container(
        width: width,
        height: 40,
        child: OutlineButton(
          child: Text(text),
          onPressed: () {
            onChange(true);
          },
        ),
      ),
    );
  }
}
