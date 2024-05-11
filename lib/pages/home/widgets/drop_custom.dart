import 'package:flutter/material.dart';

class DropDownCustom extends StatefulWidget {
  const DropDownCustom({super.key});

  @override
  State<DropDownCustom> createState() => _DropDownCustomState();
}

List list = ['Masculino', 'Feminino'];
final dropValue = ValueNotifier('');

class _DropDownCustomState extends State<DropDownCustom> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dropValue,
      builder: (BuildContext context, String value, _) {
        return SizedBox(
          width: 280,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            isExpanded: true,
            decoration: const InputDecoration(),
            hint: const Text('Sexo'),
            value: (value.isEmpty) ? null : value,
            onChanged: (option) => dropValue.value = option.toString(),
            items: list
                .map(
                  (option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
