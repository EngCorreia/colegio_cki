

import 'package:cki/project/layers/presentation/ui_widgets/index_menu/index_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../infra/locator.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/env/dev/unig4retail.invest_prime.dev.env").then((value) {
    setupLocator(dotenv.env['BASE_URL'], enviroment: dotenv.env['ENV']);
  });
  runApp(const IndexPage());
}

