import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:brasil_fields/brasil_fields.dart';

import '../../../../core/extensions/formatter_extension.dart';
import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../models/student_model.dart';
import '../../controllers/student_form_controller.dart';
import '../../enums/student_form_state_status.dart';
import '../components/custom_student_form_fields.dart';

class StudentFormPage extends StatefulWidget {
  const StudentFormPage({super.key});

  @override
  State<StudentFormPage> createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage>
    with Loader, Messages {
  final int? studentId = Modular.args.data;
  final studentFormController = Modular.get<StudentFormController>();

  final formKey = GlobalKey<FormState>();

  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final monthlyPaymentEC = TextEditingController();
  final descriptionEC = TextEditingController();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusReactionDisposer = reaction(
        (_) => studentFormController.stateStatus,
        (status) {
          switch (status) {
            case StudentFormStateStatus.initial:
              break;
            case StudentFormStateStatus.loading:
              showLoader();
              break;
            case StudentFormStateStatus.loaded:
              final StudentModel student = studentFormController.studentModel!;
              nameEC.text = student.name;
              emailEC.text = student.email;
              phoneEC.text = student.phone;
              monthlyPaymentEC.text = student.monthlyPayment.toPTBRCurrency;
              descriptionEC.text = student.description ?? '';
              hideLoader();
              break;
            case StudentFormStateStatus.error:
              hideLoader();
              showError(studentFormController.errorMessage ?? '');
              break;
            case StudentFormStateStatus.errorOnLoad:
              hideLoader();
              showError(studentFormController.errorMessage ?? '');
              Navigator.of(context).pop();
              break;
            case StudentFormStateStatus.deleted:
            case StudentFormStateStatus.saved:
              hideLoader();
              Navigator.pop(context);
              showSuccess(
                'O Aluno foi ${status == StudentFormStateStatus.saved ? 'salvo' : 'deletado'} com sucesso.',
              );
              break;
          }
        },
      );
      studentFormController.loadData(studentId);
    });
  }

  @override
  void dispose() {
    statusReactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int? studentId = Modular.args.data;
    return Scaffold(
      backgroundColor: Colors.grey[100]!,
      appBar: AppBar(
        title: Text(
          '${studentId != null ? 'Editar' : 'Adicionar'} Aluno',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: CustomStudentFormFields(
              formKey: formKey,
              nameEC: nameEC,
              emailEC: emailEC,
              phoneEC: phoneEC,
              monthlyPaymentEC: monthlyPaymentEC,
              descriptionEC: descriptionEC,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final bool formIsValid = formKey.currentState?.validate() ?? false;
          if (formIsValid) {
            studentFormController.save(
              name: nameEC.text,
              email: emailEC.text,
              phone: phoneEC.text,
              description: descriptionEC.text,
              monthlyPayment: UtilBrasilFields.converterMoedaParaDouble(
                monthlyPaymentEC.text,
              ),
            );
          }
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.save),
      ),
    );
  }
}
