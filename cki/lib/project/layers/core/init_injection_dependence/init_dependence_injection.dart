import '../dependence_injection/save_new_student/save_new_student_injection.dart';
import '../dependence_injection/save_new_teacher_injection/save_new_teacher_injection.dart';


class InitStateInjectionDependence{
  InitStateInjectionDependence(){
    SaveStudentInject.init();
    SaveTeacherInject.init();
  }
}