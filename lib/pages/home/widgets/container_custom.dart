import 'package:flutter/material.dart';

class ContainerCustom extends StatefulWidget {
  const ContainerCustom(
      {super.key,
      required this.padding,
      required this.marginHorizontal,
      required this.marginVertical,
      required this.color,
      required this.child});

  final double padding, marginHorizontal, marginVertical;
  final Color color;
  final Widget child;

  @override
  State<ContainerCustom> createState() => _ContainerCustomState();
}

class _ContainerCustomState extends State<ContainerCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(widget.padding),
      margin: EdgeInsets.symmetric(
          horizontal: widget.marginHorizontal, vertical: widget.marginVertical),
      decoration: BoxDecoration(
        color: widget.color,
        boxShadow: const [
          BoxShadow(
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
              color: Colors.black,
              offset: Offset(1, 1))
        ],
      ),
      child: widget.child,
    );
  }
}
