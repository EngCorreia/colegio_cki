// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financa_alunos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AreaFinanceiraAluno on _AreaFinanceiraAluno, Store {
  Computed<List<dynamic>>? _$inscriptionNotPayComputed;

  @override
  List<dynamic> get inscriptionNotPay => (_$inscriptionNotPayComputed ??=
          Computed<List<dynamic>>(() => super.inscriptionNotPay,
              name: '_AreaFinanceiraAluno.inscriptionNotPay'))
      .value;
  Computed<List<dynamic>>? _$inscriptionPayComputed;

  @override
  List<dynamic> get inscriptionPay => (_$inscriptionPayComputed ??=
          Computed<List<dynamic>>(() => super.inscriptionPay,
              name: '_AreaFinanceiraAluno.inscriptionPay'))
      .value;
  Computed<List<dynamic>>? _$monthlyNotPayComputed;

  @override
  List<dynamic> get monthlyNotPay => (_$monthlyNotPayComputed ??=
          Computed<List<dynamic>>(() => super.monthlyNotPay,
              name: '_AreaFinanceiraAluno.monthlyNotPay'))
      .value;
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

  late final _$paymentEntityAtom =
      Atom(name: '_AreaFinanceiraAluno.paymentEntity', context: context);

  @override
  PaymentEntity? get paymentEntity {
    _$paymentEntityAtom.reportRead();
    return super.paymentEntity;
  }

  @override
  set paymentEntity(PaymentEntity? value) {
    _$paymentEntityAtom.reportWrite(value, super.paymentEntity, () {
      super.paymentEntity = value;
    });
  }

  late final _$totalAtom =
      Atom(name: '_AreaFinanceiraAluno.total', context: context);

  @override
  double? get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(double? value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$naoPagoAtom =
      Atom(name: '_AreaFinanceiraAluno.naoPago', context: context);

  @override
  double? get naoPago {
    _$naoPagoAtom.reportRead();
    return super.naoPago;
  }

  @override
  set naoPago(double? value) {
    _$naoPagoAtom.reportWrite(value, super.naoPago, () {
      super.naoPago = value;
    });
  }

  late final _$inscriptionListAtom =
      Atom(name: '_AreaFinanceiraAluno.inscriptionList', context: context);

  @override
  ObservableList<InscriptionModel> get inscriptionList {
    _$inscriptionListAtom.reportRead();
    return super.inscriptionList;
  }

  @override
  set inscriptionList(ObservableList<InscriptionModel> value) {
    _$inscriptionListAtom.reportWrite(value, super.inscriptionList, () {
      super.inscriptionList = value;
    });
  }

  late final _$paymentListAtom =
      Atom(name: '_AreaFinanceiraAluno.paymentList', context: context);

  @override
  ObservableList<PaymentModels> get paymentList {
    _$paymentListAtom.reportRead();
    return super.paymentList;
  }

  @override
  set paymentList(ObservableList<PaymentModels> value) {
    _$paymentListAtom.reportWrite(value, super.paymentList, () {
      super.paymentList = value;
    });
  }

  late final _$paymentListsAtom =
      Atom(name: '_AreaFinanceiraAluno.paymentLists', context: context);

  @override
  ObservableList<Payment> get paymentLists {
    _$paymentListsAtom.reportRead();
    return super.paymentLists;
  }

  @override
  set paymentLists(ObservableList<Payment> value) {
    _$paymentListsAtom.reportWrite(value, super.paymentLists, () {
      super.paymentLists = value;
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
paymentEntity: ${paymentEntity},
total: ${total},
naoPago: ${naoPago},
inscriptionList: ${inscriptionList},
paymentList: ${paymentList},
paymentLists: ${paymentLists},
list: ${list},
inscriptionNotPay: ${inscriptionNotPay},
inscriptionPay: ${inscriptionPay},
monthlyNotPay: ${monthlyNotPay},
paymentPago: ${paymentPago},
paymentNaoPago: ${paymentNaoPago}
    ''';
  }
}
