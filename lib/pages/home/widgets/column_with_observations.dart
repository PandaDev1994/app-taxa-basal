import 'package:flutter/material.dart';

class ColumnWithObservation extends StatelessWidget {
  const ColumnWithObservation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Levando em conta sua taxa de atividade fisíca rescolha uma opção',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Sedentários (pouco ou nenhum exercício)',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Levemente ativo (exercício leve 1 a 3 dias por semana)',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Moderadamente ativo (exercício moderado, faz esportes 3 a 5 dias por semana)',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Altamente ativo (exercício pesado de 5 a 6 dias por semana)',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Extremamente ativo (exercício pesado diariamente e até 2 vezes por dia)',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
