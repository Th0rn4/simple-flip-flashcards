import 'package:flutter/material.dart';
import 'dart:math'; 

class FlashTile extends StatefulWidget {
  final String question;
  final String answer;

  const FlashTile({required this.question, required this.answer, Key? key}) : super(key: key);

  @override
  _FlashTileState createState() => _FlashTileState();
}

class _FlashTileState extends State<FlashTile> {
  bool _showFrontSide = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showFrontSide = !_showFrontSide;
        });
      },
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        transitionBuilder: _transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeOutBack,
      ),
    );
  }

  Widget _buildFront() {
    return _buildLayout(
      key: ValueKey(true),
      backgroundColor: Colors.blue,
      text: widget.question,
    );
  }

  Widget _buildRear() {
    return _buildLayout(
      key: ValueKey(false),
      backgroundColor: Colors.green,
      text: widget.answer,
    );
  }

  Widget _buildLayout({required Key key, required Color backgroundColor, required String text}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: backgroundColor,
        border: Border.all(color: Colors.white, width: 4),
      ),
      width: 300,
      height: 300,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotate = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotate,
      child: widget,
      builder: (context, child) {
        final isUnder = (ValueKey(_showFrontSide) != widget.key);
        final value = isUnder ? min(rotate.value, pi / 2) : rotate.value;
        return Transform(
          transform: Matrix4.rotationY(value),
          child: child,
          alignment: Alignment.center,
        );
      },
    );
  }
}
