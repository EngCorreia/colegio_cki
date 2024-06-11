import 'package:stacked/stacked_annotations.dart';
import '../views/transport/transport_view.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: TransportView),

], logger: StackedLogger())
class AppSetup {}
