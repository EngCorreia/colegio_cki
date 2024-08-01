
import 'package:stacked/stacked_annotations.dart';
import '../views/atl_view/alt_view.dart';
import '../views/teacher/add_teacher/add_teacher_view.dart';


@StackedApp(routes: [
  AdaptiveRoute(page: AtlView),
  AdaptiveRoute(page: AddTeacherView),

], logger: StackedLogger())
class AppSetup {}
