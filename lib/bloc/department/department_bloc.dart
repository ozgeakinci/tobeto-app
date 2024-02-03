import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/department/department_event.dart';
import 'package:tobeto_app/bloc/department/department_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  DepartmentBloc() : super(DepartmentInitial()) {
    on<GetDepartment>((event, emit) async {
      try {
        final departmentInfo = await UserRepositories()
            .getDepartmentInfoFromFirebase(event.department);
        print("Veriler Deparmtnettt----------");
        print(departmentInfo.videos);
        emit(DepartmentLoaded(educationDepartmenogInfo: departmentInfo.videos));
      } catch (e) {
        emit(DepartmentError()); // Degişecek
        print("DepartmentError   Hataya düştüüü");
        print(e);
      }
    });

    on<ResetDepartmentEvent>((event, emit) async {
      try {
        emit(DepartmentInitial());
        print("DepartmentInitial Durumuna geçildiiiii");
      } catch (e) {
        emit(DepartmentError()); // Degişecek
        print("DepartmentError Hataya düştüüüü");
        print(e);
      }
    });
  }
}
