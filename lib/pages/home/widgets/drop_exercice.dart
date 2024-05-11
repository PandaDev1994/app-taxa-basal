import 'package:flutter/material.dart';

class DropDownCustomExecice extends StatefulWidget {
  const DropDownCustomExecice({super.key});

  @override
  State<DropDownCustomExecice> createState() => _DropDownCustomExeciceState();
}

List listExecice = [
  'Sedentário',
  'Levemente ativo',
  'Moderadamente ativo',
  'Altamente ativo',
  'Extremamente ativo'
];
final dropValueExercice = ValueNotifier('');

class _DropDownCustomExeciceState extends State<DropDownCustomExecice> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dropValueExercice,
      builder: (BuildContext context, String valueExercice, _) {
        return SizedBox(
          width: 280,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            isExpanded: true,
            decoration: const InputDecoration(),
            hint: const Text('Nível de Exercicío'),
            value: (valueExercice.isEmpty) ? null : valueExercice,
            onChanged: (optionExercice) =>
                dropValueExercice.value = optionExercice.toString(),
            items: listExecice
                .map(
                  (optionExercice) => DropdownMenuItem(
                    value: optionExercice,
                    child: Text(optionExercice),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
