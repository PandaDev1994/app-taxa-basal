import 'package:flutter/material.dart';
import 'package:projeto_taxa_basal/pages/home/widgets/button_calc.dart';
import 'package:projeto_taxa_basal/pages/home/widgets/column_with_observations.dart';
import 'package:projeto_taxa_basal/pages/home/widgets/container_custom.dart';
import 'package:projeto_taxa_basal/pages/home/widgets/drop_custom.dart';
import 'package:projeto_taxa_basal/pages/home/widgets/drop_exercice.dart';
import 'package:projeto_taxa_basal/pages/home/widgets/text_field_information.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

late AnimationController animationController;

TextEditingController pesoController = TextEditingController();
TextEditingController alturaController = TextEditingController();
TextEditingController idadeController = TextEditingController();

String text = '';

bool isLoading = false;
bool isCal = false;
bool hasCode = false;

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldInformation(
                  size: size,
                  controller: pesoController,
                  text: 'Peso',
                  isLoading: isLoading,
                ),
                TextFieldInformation(
                  size: size,
                  controller: alturaController,
                  text: 'Altura',
                  isLoading: isLoading,
                ),
                TextFieldInformation(
                  size: size,
                  controller: idadeController,
                  text: 'Idade',
                  isLoading: isLoading,
                ),
                const DropDownCustom(),
                const SizedBox(
                  height: 60,
                ),
                ContainerCustom(
                  padding: 13,
                  marginHorizontal: 5,
                  marginVertical: 0,
                  color: Colors.grey.withOpacity(0.3),
                  child: const ColumnWithObservation(),
                ),
                const SizedBox(
                  height: 60,
                ),
                const DropDownCustomExecice(),
                const SizedBox(
                  height: 60,
                ),
                isCal
                    ? const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.black),
                        ),
                      )
                    : ButtonCalc(
                        voidCallback: () => calc(
                            pesoController, alturaController, idadeController),
                      ),
                const SizedBox(
                  height: 50,
                ),
                hasCode
                    ? ContainerCustom(
                        padding: 10,
                        marginHorizontal: 5,
                        marginVertical: 10,
                        color: Colors.deepPurple.withOpacity(0.3),
                        child: Text(
                          text,
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w600),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calc(
    TextEditingController peso,
    TextEditingController altura,
    TextEditingController idade,
  ) async {
    double? multplication;
    if (dropValue.value.isEmpty ||
        dropValueExercice.value.isEmpty ||
        peso.text.isEmpty ||
        altura.text.isEmpty ||
        idade.text.isEmpty) {
      return setState(() {
        text = 'Aluma informação faltando por favor confira';
      });
    }

    switch (dropValueExercice.value) {
      case 'Sedentário':
        multplication = 1.2;
        break;

      case 'Levemente ativo':
        multplication = 1.375;
        break;

      case 'Moderadamente ativo':
        multplication = 1.55;
        break;

      case 'Altamente ativo':
        multplication = 1.725;
        break;

      case 'Extremamente ativo':
        multplication = 1.9;
        break;

      default:
        setState(() {
          text = 'Faltou alguma informação por favor corrija';
          isLoading = false;
          isCal = false;
          hasCode = false;
        });
        break;
    }

    switch (dropValue.value) {
      case 'Masculino':
        setState(() {
          isLoading = true;
          isCal = true;
          hasCode = true;
        });

        await Future.delayed(const Duration(seconds: 1));

        var basal = (66 +
                (13.7 * double.parse(peso.text)) +
                (5 * double.parse(altura.text)) -
                (6.8 * int.parse(idade.text))) *
            multplication!;
        setState(() {
          text = 'Sua taxa basal é de ${basal.toStringAsFixed(2)}';

          dropValue.value = '';
          dropValueExercice.value = '';

          peso.text = '';
          altura.text = '';
          idade.text = '';

          isLoading = false;
          isCal = false;
        });
        break;

      case 'Feminino':
        setState(() {
          isLoading = true;
          isCal = true;
          hasCode = true;
        });

        await Future.delayed(const Duration(seconds: 1));

        var basal = (655 +
                (9.6 * double.parse(peso.text)) +
                (1.8 * double.parse(altura.text)) -
                (4.7 * int.parse(idade.text))) *
            multplication!;

        setState(() {
          text = 'Sua taxa basal é de ${basal.toStringAsFixed(2)}';
          isLoading = false;
          isCal = false;

          dropValue.value = '';
          dropValueExercice.value = '';

          peso.text = '';
          altura.text = '';
          idade.text = '';
        });

      case '':
        setState(() {
          text = 'Faltou alguma informação por favor corrija';
          isLoading = false;
          isCal = false;
          hasCode = false;
        });
        break;

      default:
        setState(() {
          text = 'Faltou alguma informação por favor corrija';
          isLoading = false;
          isCal = false;
          hasCode = false;
        });
        break;
    }
  }
}
