// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentFormController on StudentFormControllerBase, Store {
  late final _$_stateStatusAtom =
      Atom(name: 'StudentFormControllerBase._stateStatus', context: context);

  StudentFormStateStatus get stateStatus {
    _$_stateStatusAtom.reportRead();
    return super._stateStatus;
  }

  @override
  StudentFormStateStatus get _stateStatus => stateStatus;

  @override
  set _stateStatus(StudentFormStateStatus value) {
    _$_stateStatusAtom.reportWrite(value, super._stateStatus, () {
      super._stateStatus = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'StudentFormControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_studentModelAtom =
      Atom(name: 'StudentFormControllerBase._studentModel', context: context);

  StudentModel? get studentModel {
    _$_studentModelAtom.reportRead();
    return super._studentModel;
  }

  @override
  StudentModel? get _studentModel => studentModel;

  @override
  set _studentModel(StudentModel? value) {
    _$_studentModelAtom.reportWrite(value, super._studentModel, () {
      super._studentModel = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('StudentFormControllerBase.save', context: context);

  @override
  Future<void> save(
      {required String name,
      required String email,
      required String phone,
      required double monthlyPayment,
      String? description}) {
    return _$saveAsyncAction.run(() => super.save(
        name: name,
        email: email,
        phone: phone,
        monthlyPayment: monthlyPayment,
        description: description));
  }

  late final _$loadDataAsyncAction =
      AsyncAction('StudentFormControllerBase.loadData', context: context);

  @override
  Future<void> loadData(int? id) {
    return _$loadDataAsyncAction.run(() => super.loadData(id));
  }

  late final _$deleteAsyncAction =
      AsyncAction('StudentFormControllerBase.delete', context: context);

  @override
  Future<void> delete() {
    return _$deleteAsyncAction.run(() => super.delete());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
