// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financa_alunos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AreaFinanceiraAluno on _AreaFinanceiraAluno, Store {
  Computed<List<Payment>>? _$paymentPagoComputed;

  @override
  List<Payment> get paymentPago => (_$paymentPagoComputed ??=
          Computed<List<Payment>>(() => super.paymentPago,
              name: '_AreaFinanceiraAluno.paymentPago'))
      .value;
  Computed<List<Payment>>? _$paymentNaoPagoComputed;

  @override
  List<Payment> get paymentNaoPago => (_$paymentNaoPagoComputed ??=
          Computed<List<Payment>>(() => super.paymentNaoPago,
              name: '_AreaFinanceiraAluno.paymentNaoPago'))
      .value;

  late final _$paymentAtom =
      Atom(name: '_AreaFinanceiraAluno.payment', context: context);

  @override
  Payment? get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(Payment? value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  late final _$totalAtom =
      Atom(name: '_AreaFinanceiraAluno.total', context: context);

  @override
  int? get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(int? value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$naoPagoAtom =
      Atom(name: '_AreaFinanceiraAluno.naoPago', context: context);

  @override
  int? get naoPago {
    _$naoPagoAtom.reportRead();
    return super.naoPago;
  }

  @override
  set naoPago(int? value) {
    _$naoPagoAtom.reportWrite(value, super.naoPago, () {
      super.naoPago = value;
    });
  }

  late final _$paymentListAtom =
      Atom(name: '_AreaFinanceiraAluno.paymentList', context: context);

  @override
  ObservableList<Payment> get paymentList {
    _$paymentListAtom.reportRead();
    return super.paymentList;
  }

  @override
  set paymentList(ObservableList<Payment> value) {
    _$paymentListAtom.reportWrite(value, super.paymentList, () {
      super.paymentList = value;
    });
  }

  late final _$listAtom =
      Atom(name: '_AreaFinanceiraAluno.list', context: context);

  @override
  List<dynamic> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<dynamic> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  @override
  String toString() {
    return '''
payment: ${payment},
total: ${total},
naoPago: ${naoPago},
paymentList: ${paymentList},
list: ${list},
paymentPago: ${paymentPago},
paymentNaoPago: ${paymentNaoPago}
    ''';
  }
}
