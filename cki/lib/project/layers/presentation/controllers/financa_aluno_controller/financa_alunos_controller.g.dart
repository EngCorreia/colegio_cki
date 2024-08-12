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
  Computed<List<dynamic>>? _$monthlyPayComputed;

  @override
  List<dynamic> get monthlyPay =>
      (_$monthlyPayComputed ??= Computed<List<dynamic>>(() => super.monthlyPay,
              name: '_AreaFinanceiraAluno.monthlyPay'))
          .value;
  Computed<List<dynamic>>? _$atlNotPayComputed;

  @override
  List<dynamic> get atlNotPay =>
      (_$atlNotPayComputed ??= Computed<List<dynamic>>(() => super.atlNotPay,
              name: '_AreaFinanceiraAluno.atlNotPay'))
          .value;
  Computed<List<dynamic>>? _$atlPayComputed;

  @override
  List<dynamic> get atlPay =>
      (_$atlPayComputed ??= Computed<List<dynamic>>(() => super.atlPay,
              name: '_AreaFinanceiraAluno.atlPay'))
          .value;
  Computed<List<dynamic>>? _$booksNotPayComputed;

  @override
  List<dynamic> get booksNotPay => (_$booksNotPayComputed ??=
          Computed<List<dynamic>>(() => super.booksNotPay,
              name: '_AreaFinanceiraAluno.booksNotPay'))
      .value;
  Computed<List<dynamic>>? _$booksPayComputed;

  @override
  List<dynamic> get booksPay =>
      (_$booksPayComputed ??= Computed<List<dynamic>>(() => super.booksPay,
              name: '_AreaFinanceiraAluno.booksPay'))
          .value;
  Computed<List<dynamic>>? _$uniformNotPayComputed;

  @override
  List<dynamic> get uniformNotPay => (_$uniformNotPayComputed ??=
          Computed<List<dynamic>>(() => super.uniformNotPay,
              name: '_AreaFinanceiraAluno.uniformNotPay'))
      .value;
  Computed<List<dynamic>>? _$uniformPayComputed;

  @override
  List<dynamic> get uniformPay =>
      (_$uniformPayComputed ??= Computed<List<dynamic>>(() => super.uniformPay,
              name: '_AreaFinanceiraAluno.uniformPay'))
          .value;
  Computed<List<dynamic>>? _$transportNotPayComputed;

  @override
  List<dynamic> get transportNotPay => (_$transportNotPayComputed ??=
          Computed<List<dynamic>>(() => super.transportNotPay,
              name: '_AreaFinanceiraAluno.transportNotPay'))
      .value;
  Computed<List<dynamic>>? _$transportPayComputed;

  @override
  List<dynamic> get transportPay => (_$transportPayComputed ??=
          Computed<List<dynamic>>(() => super.transportPay,
              name: '_AreaFinanceiraAluno.transportPay'))
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

  late final _$totalMonthlyAtom =
      Atom(name: '_AreaFinanceiraAluno.totalMonthly', context: context);

  @override
  double? get totalMonthly {
    _$totalMonthlyAtom.reportRead();
    return super.totalMonthly;
  }

  @override
  set totalMonthly(double? value) {
    _$totalMonthlyAtom.reportWrite(value, super.totalMonthly, () {
      super.totalMonthly = value;
    });
  }

  late final _$naoPagoMonthlyAtom =
      Atom(name: '_AreaFinanceiraAluno.naoPagoMonthly', context: context);

  @override
  double? get naoPagoMonthly {
    _$naoPagoMonthlyAtom.reportRead();
    return super.naoPagoMonthly;
  }

  @override
  set naoPagoMonthly(double? value) {
    _$naoPagoMonthlyAtom.reportWrite(value, super.naoPagoMonthly, () {
      super.naoPagoMonthly = value;
    });
  }

  late final _$totalAtlAtom =
      Atom(name: '_AreaFinanceiraAluno.totalAtl', context: context);

  @override
  double? get totalAtl {
    _$totalAtlAtom.reportRead();
    return super.totalAtl;
  }

  @override
  set totalAtl(double? value) {
    _$totalAtlAtom.reportWrite(value, super.totalAtl, () {
      super.totalAtl = value;
    });
  }

  late final _$naoPagoAtlAtom =
      Atom(name: '_AreaFinanceiraAluno.naoPagoAtl', context: context);

  @override
  double? get naoPagoAtl {
    _$naoPagoAtlAtom.reportRead();
    return super.naoPagoAtl;
  }

  @override
  set naoPagoAtl(double? value) {
    _$naoPagoAtlAtom.reportWrite(value, super.naoPagoAtl, () {
      super.naoPagoAtl = value;
    });
  }

  late final _$totalBooksAtom =
      Atom(name: '_AreaFinanceiraAluno.totalBooks', context: context);

  @override
  double? get totalBooks {
    _$totalBooksAtom.reportRead();
    return super.totalBooks;
  }

  @override
  set totalBooks(double? value) {
    _$totalBooksAtom.reportWrite(value, super.totalBooks, () {
      super.totalBooks = value;
    });
  }

  late final _$naoPagoBooksAtom =
      Atom(name: '_AreaFinanceiraAluno.naoPagoBooks', context: context);

  @override
  double? get naoPagoBooks {
    _$naoPagoBooksAtom.reportRead();
    return super.naoPagoBooks;
  }

  @override
  set naoPagoBooks(double? value) {
    _$naoPagoBooksAtom.reportWrite(value, super.naoPagoBooks, () {
      super.naoPagoBooks = value;
    });
  }

  late final _$totalUniformAtom =
      Atom(name: '_AreaFinanceiraAluno.totalUniform', context: context);

  @override
  double? get totalUniform {
    _$totalUniformAtom.reportRead();
    return super.totalUniform;
  }

  @override
  set totalUniform(double? value) {
    _$totalUniformAtom.reportWrite(value, super.totalUniform, () {
      super.totalUniform = value;
    });
  }

  late final _$naoPagoUniformAtom =
      Atom(name: '_AreaFinanceiraAluno.naoPagoUniform', context: context);

  @override
  double? get naoPagoUniform {
    _$naoPagoUniformAtom.reportRead();
    return super.naoPagoUniform;
  }

  @override
  set naoPagoUniform(double? value) {
    _$naoPagoUniformAtom.reportWrite(value, super.naoPagoUniform, () {
      super.naoPagoUniform = value;
    });
  }

  late final _$totalTransportAtom =
      Atom(name: '_AreaFinanceiraAluno.totalTransport', context: context);

  @override
  double? get totalTransport {
    _$totalTransportAtom.reportRead();
    return super.totalTransport;
  }

  @override
  set totalTransport(double? value) {
    _$totalTransportAtom.reportWrite(value, super.totalTransport, () {
      super.totalTransport = value;
    });
  }

  late final _$naoPagoTransportAtom =
      Atom(name: '_AreaFinanceiraAluno.naoPagoTransport', context: context);

  @override
  double? get naoPagoTransport {
    _$naoPagoTransportAtom.reportRead();
    return super.naoPagoTransport;
  }

  @override
  set naoPagoTransport(double? value) {
    _$naoPagoTransportAtom.reportWrite(value, super.naoPagoTransport, () {
      super.naoPagoTransport = value;
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
totalMonthly: ${totalMonthly},
naoPagoMonthly: ${naoPagoMonthly},
totalAtl: ${totalAtl},
naoPagoAtl: ${naoPagoAtl},
totalBooks: ${totalBooks},
naoPagoBooks: ${naoPagoBooks},
totalUniform: ${totalUniform},
naoPagoUniform: ${naoPagoUniform},
totalTransport: ${totalTransport},
naoPagoTransport: ${naoPagoTransport},
total: ${total},
naoPago: ${naoPago},
inscriptionList: ${inscriptionList},
paymentList: ${paymentList},
paymentLists: ${paymentLists},
list: ${list},
inscriptionNotPay: ${inscriptionNotPay},
inscriptionPay: ${inscriptionPay},
monthlyNotPay: ${monthlyNotPay},
monthlyPay: ${monthlyPay},
atlNotPay: ${atlNotPay},
atlPay: ${atlPay},
booksNotPay: ${booksNotPay},
booksPay: ${booksPay},
uniformNotPay: ${uniformNotPay},
uniformPay: ${uniformPay},
transportNotPay: ${transportNotPay},
transportPay: ${transportPay},
paymentPago: ${paymentPago},
paymentNaoPago: ${paymentNaoPago}
    ''';
  }
}
