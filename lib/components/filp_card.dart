import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memo_game/components/back_card.dart';
import 'package:memo_game/components/front_card.dart';

class FilpCard extends StatefulWidget {
  final String simbol;
  final int order;
  const FilpCard({
    super.key,
    required this.simbol,
    required this.order,
  });

  @override
  State<FilpCard> createState() => _FilpCardState();
}

class _FilpCardState extends State<FilpCard> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  void filp() {
    if (_status == AnimationStatus.dismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void showBackSimbolAfterSeconds(int seconds) {
    Timer(Duration(seconds: seconds), () {
      if (_status == AnimationStatus.dismissed) {
        _controller.forward().whenComplete(() => _controller.reverse());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
    showBackSimbolAfterSeconds(widget.order);
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(2, 1, 0.0015)
        ..rotateY(pi * _animation.value),
      child: GestureDetector(
        onTap: filp,
        child: Card(
          child: _animation.value <= 0.5
              ? FrontCard(
                  backgroundColor: Theme.of(context).primaryColor,
                )
              : BackCard(
                  simbol: widget.simbol,
                  backgroundColor: Theme.of(context).disabledColor,
                ),
        ),
      ),
    );
  }
}
