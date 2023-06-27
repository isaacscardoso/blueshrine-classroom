import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/styles/text_styles.dart';

class CustomStudentFormFields extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController nameEC;
  final TextEditingController emailEC;
  final TextEditingController phoneEC;
  final TextEditingController monthlyPaymentEC;
  final TextEditingController descriptionEC;

  const CustomStudentFormFields({
    super.key,
    required this.formKey,
    required this.nameEC,
    required this.emailEC,
    required this.phoneEC,
    required this.monthlyPaymentEC,
    required this.descriptionEC,
  });

  @override
  State<CustomStudentFormFields> createState() =>
      _CustomStudentFormFieldsState();
}

class _CustomStudentFormFieldsState extends State<CustomStudentFormFields> {
  @override
  void dispose() {
    widget.nameEC.dispose();
    widget.emailEC.dispose();
    widget.phoneEC.dispose();
    widget.monthlyPaymentEC.dispose();
    widget.descriptionEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          TextFormField(
            controller: widget.nameEC,
            validator: Validatorless.required('Preencha o campo NOME.'),
            decoration: InputDecoration(
              label: Text(
                'Nome',
                style: context.textStyles.textRegular.copyWith(
                  fontSize: 17,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: widget.emailEC,
            validator: Validatorless.multiple([
              Validatorless.required('Preencha o campo E-MAIL.'),
              Validatorless.email('O Formato do E-Mail está incorreto.'),
            ]),
            decoration: InputDecoration(
              label: Text(
                'E-Mail',
                style: context.textStyles.textRegular.copyWith(
                  fontSize: 17,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: widget.phoneEC,
            validator: Validatorless.required('Preencha o campo TELEFONE.'),
            decoration: InputDecoration(
              label: Text(
                'Telefone',
                style: context.textStyles.textRegular.copyWith(
                  fontSize: 17,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: widget.monthlyPaymentEC,
            validator: Validatorless.required('Preencha o campo MENSALIDADE.'),
            decoration: InputDecoration(
              label: Text(
                'Mensalidade',
                style: context.textStyles.textRegular.copyWith(
                  fontSize: 17,
                ),
              ),
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              CentavosInputFormatter(moeda: true),
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: widget.descriptionEC,
            minLines: 10,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              label: Text(
                'Descrição',
                style: context.textStyles.textRegular.copyWith(
                  fontSize: 17,
                ),
              ),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
