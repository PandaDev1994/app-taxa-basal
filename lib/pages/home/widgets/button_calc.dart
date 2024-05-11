import 'package:flutter/material.dart';

class ButtonCalc extends StatelessWidget {
  final VoidCallback voidCallback;
  const ButtonCalc({
    super.key,
    required this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: voidCallback,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text('Calcular'),
      ),
    );
  }
}
