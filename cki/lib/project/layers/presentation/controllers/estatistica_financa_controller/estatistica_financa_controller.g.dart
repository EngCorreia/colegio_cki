// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estatistica_financa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EstatisticaGeralFinanca on _EstatisticaGeralFinanca, Store {
  Computed<List<dynamic>>? _$mesJaneiroPagoComputed;

  @override
  List<dynamic> get mesJaneiroPago => (_$mesJaneiroPagoComputed ??=
          Computed<List<dynamic>>(() => super.mesJaneiroPago,
              name: '_EstatisticaGeralFinanca.mesJaneiroPago'))
      .value;
  Computed<List<dynamic>>? _$mesJaneiroNaoPagoComputed;

  @override
  List<dynamic> get mesJaneiroNaoPago => (_$mesJaneiroNaoPagoComputed ??=
          Computed<List<dynamic>>(() => super.mesJaneiroNaoPago,
              name: '_EstatisticaGeralFinanca.mesJaneiroNaoPago'))
      .value;
  Computed<List<dynamic>>? _$mesFevereiroPagoComputed;

  @override
  List<dynamic> get mesFevereiroPago => (_$mesFevereiroPagoComputed ??=
          Computed<List<dynamic>>(() => super.mesFevereiroPago,
              name: '_EstatisticaGeralFinanca.mesFevereiroPago'))
      .value;
  Computed<List<dynamic>>? _$mesFevereiroNaoPagoComputed;

  @override
  List<dynamic> get mesFevereiroNaoPago => (_$mesFevereiroNaoPagoComputed ??=
          Computed<List<dynamic>>(() => super.mesFevereiroNaoPago,
              name: '_EstatisticaGeralFinanca.mesFevereiroNaoPago'))
      .value;

  late final _$totalJaneiroPagoAtom =
      Atom(name: '_EstatisticaGeralFinanca.totalJaneiroPago', context: context);

  @override
  int? get totalJaneiroPago {
    _$totalJaneiroPagoAtom.reportRead();
    return super.totalJaneiroPago;
  }

  @override
  set totalJaneiroPago(int? value) {
    _$totalJaneiroPagoAtom.reportWrite(value, super.totalJaneiroPago, () {
      super.totalJaneiroPago = value;
    });
  }

  late final _$totalJaneiroNaoPagoAtom = Atom(
      name: '_EstatisticaGeralFinanca.totalJaneiroNaoPago', context: context);

  @override
  int? get totalJaneiroNaoPago {
    _$totalJaneiroNaoPagoAtom.reportRead();
    return super.totalJaneiroNaoPago;
  }

  @override
  set totalJaneiroNaoPago(int? value) {
    _$totalJaneiroNaoPagoAtom.reportWrite(value, super.totalJaneiroNaoPago, () {
      super.totalJaneiroNaoPago = value;
    });
  }

  late final _$mesJaneiroAtom =
      Atom(name: '_EstatisticaGeralFinanca.mesJaneiro', context: context);

  @override
  List<dynamic> get mesJaneiro {
    _$mesJaneiroAtom.reportRead();
    return super.mesJaneiro;
  }

  @override
  set mesJaneiro(List<dynamic> value) {
    _$mesJaneiroAtom.reportWrite(value, super.mesJaneiro, () {
      super.mesJaneiro = value;
    });
  }

  late final _$totalFevereiroPagoAtom = Atom(
      name: '_EstatisticaGeralFinanca.totalFevereiroPago', context: context);

  @override
  int? get totalFevereiroPago {
    _$totalFevereiroPagoAtom.reportRead();
    return super.totalFevereiroPago;
  }

  @override
  set totalFevereiroPago(int? value) {
    _$totalFevereiroPagoAtom.reportWrite(value, super.totalFevereiroPago, () {
      super.totalFevereiroPago = value;
    });
  }

  late final _$totalFevereiroNaoPagoAtom = Atom(
      name: '_EstatisticaGeralFinanca.totalFevereiroNaoPago', context: context);

  @override
  int? get totalFevereiroNaoPago {
    _$totalFevereiroNaoPagoAtom.reportRead();
    return super.totalFevereiroNaoPago;
  }

  @override
  set totalFevereiroNaoPago(int? value) {
    _$totalFevereiroNaoPagoAtom.reportWrite(value, super.totalFevereiroNaoPago,
        () {
      super.totalFevereiroNaoPago = value;
    });
  }

  late final _$mesFevereiroAtom =
      Atom(name: '_EstatisticaGeralFinanca.mesFevereiro', context: context);

  @override
  List<dynamic> get mesFevereiro {
    _$mesFevereiroAtom.reportRead();
    return super.mesFevereiro;
  }

  @override
  set mesFevereiro(List<dynamic> value) {
    _$mesFevereiroAtom.reportWrite(value, super.mesFevereiro, () {
      super.mesFevereiro = value;
    });
  }

  @override
  String toString() {
    return '''
totalJaneiroPago: ${totalJaneiroPago},
totalJaneiroNaoPago: ${totalJaneiroNaoPago},
mesJaneiro: ${mesJaneiro},
totalFevereiroPago: ${totalFevereiroPago},
totalFevereiroNaoPago: ${totalFevereiroNaoPago},
mesFevereiro: ${mesFevereiro},
mesJaneiroPago: ${mesJaneiroPago},
mesJaneiroNaoPago: ${mesJaneiroNaoPago},
mesFevereiroPago: ${mesFevereiroPago},
mesFevereiroNaoPago: ${mesFevereiroNaoPago}
    ''';
  }
}
