import 'package:cki/project/layers/presentation/ui_widgets/teachers_ui/list_of_teachers/read_teachers.dart';
import 'package:stacked/stacked_annotations.dart';
import '../views/transport/transport_view.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: TransportView),
  AdaptiveRoute(page: Teachers),

], logger: StackedLogger())
class AppSetup {}
