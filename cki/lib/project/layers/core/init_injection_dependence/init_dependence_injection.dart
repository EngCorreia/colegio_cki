import '../dependence_injection/login_injection/login_injection.dart';
import '../dependence_injection/read_course_injection/read_course_injection.dart';
import '../dependence_injection/read_teachers_injection/read_teachers_injection.dart';
import '../dependence_injection/save_new_student/save_new_student_injection.dart';
import '../dependence_injection/save_new_teacher_injection/save_new_teacher_injection.dart';


class InitStateInjectionDependence{
  InitStateInjectionDependence(){
    SaveStudentInject.init();
    SaveTeacherInject.init();
    ReadCourseInject.init();
    ReadTeachersInject.init();
    LoginInject.init();
  }
}