
import 'package:stacked/stacked_annotations.dart';
import '../views/teacher/add_teacher/add_teacher_view.dart';
import '../views/transport/transport_view.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: TransportView),
  AdaptiveRoute(page: AddTeacherView),

], logger: StackedLogger())
class AppSetup {}
