// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentController on StudentControllerBase, Store {
  late final _$_stateStatusAtom =
      Atom(name: 'StudentControllerBase._stateStatus', context: context);

  StudentStateStatus get stateStatus {
    _$_stateStatusAtom.reportRead();
    return super._stateStatus;
  }

  @override
  StudentStateStatus get _stateStatus => stateStatus;

  @override
  set _stateStatus(StudentStateStatus value) {
    _$_stateStatusAtom.reportWrite(value, super._stateStatus, () {
      super._stateStatus = value;
    });
  }

  late final _$_studentsAtom =
      Atom(name: 'StudentControllerBase._students', context: context);

  List<StudentModel> get students {
    _$_studentsAtom.reportRead();
    return super._students;
  }

  @override
  List<StudentModel> get _students => students;

  @override
  set _students(List<StudentModel> value) {
    _$_studentsAtom.reportWrite(value, super._students, () {
      super._students = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'StudentControllerBase._errorMessage', context: context);

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

  late final _$_filteredNameAtom =
      Atom(name: 'StudentControllerBase._filteredName', context: context);

  String? get filteredName {
    _$_filteredNameAtom.reportRead();
    return super._filteredName;
  }

  @override
  String? get _filteredName => filteredName;

  @override
  set _filteredName(String? value) {
    _$_filteredNameAtom.reportWrite(value, super._filteredName, () {
      super._filteredName = value;
    });
  }

  late final _$_filterEnabledAtom =
      Atom(name: 'StudentControllerBase._filterEnabled', context: context);

  bool? get filterEnabled {
    _$_filterEnabledAtom.reportRead();
    return super._filterEnabled;
  }

  @override
  bool? get _filterEnabled => filterEnabled;

  @override
  set _filterEnabled(bool? value) {
    _$_filterEnabledAtom.reportWrite(value, super._filterEnabled, () {
      super._filterEnabled = value;
    });
  }

  late final _$_studentSelectedAtom =
      Atom(name: 'StudentControllerBase._studentSelected', context: context);

  StudentModel? get studentSelected {
    _$_studentSelectedAtom.reportRead();
    return super._studentSelected;
  }

  @override
  StudentModel? get _studentSelected => studentSelected;

  @override
  set _studentSelected(StudentModel? value) {
    _$_studentSelectedAtom.reportWrite(value, super._studentSelected, () {
      super._studentSelected = value;
    });
  }

  late final _$addAsyncAction =
      AsyncAction('StudentControllerBase.add', context: context);

  @override
  Future<void> add() {
    return _$addAsyncAction.run(() => super.add());
  }

  late final _$updateAsyncAction =
      AsyncAction('StudentControllerBase.update', context: context);

  @override
  Future<void> update(StudentModel student) {
    return _$updateAsyncAction.run(() => super.update(student));
  }

  late final _$fetchAllAsyncAction =
      AsyncAction('StudentControllerBase.fetchAll', context: context);

  @override
  Future<void> fetchAll() {
    return _$fetchAllAsyncAction.run(() => super.fetchAll());
  }

  late final _$fetchByIdAsyncAction =
      AsyncAction('StudentControllerBase.fetchById', context: context);

  @override
  Future<void> fetchById(String name) {
    return _$fetchByIdAsyncAction.run(() => super.fetchById(name));
  }

  late final _$StudentControllerBaseActionController =
      ActionController(name: 'StudentControllerBase', context: context);

  @override
  void changeFilter(bool? isEnabled) {
    final _$actionInfo = _$StudentControllerBaseActionController.startAction(
        name: 'StudentControllerBase.changeFilter');
    try {
      return super.changeFilter(isEnabled);
    } finally {
      _$StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
