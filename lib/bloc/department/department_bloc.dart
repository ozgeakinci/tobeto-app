import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/department/department_event.dart';
import 'package:tobeto_app/bloc/department/department_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  DepartmentBloc() : super(DepartmentInitial()) {
    on<FetchDepartmentRequested>((event, emit) async {
      try {
        final departmentInfo = await UserRepositories()
            .getDepartmentInfoFromFirebase(event.department);
        print(departmentInfo.lessonList);
        emit(DepartmentLoaded(
            educationDepartmenogInfo: departmentInfo.lessonList));
      } catch (e) {
        emit(DepartmentError());
        print("DepartmentError FetchDepartmentRequested erorrrr");
        print(e);
      }
    });

    on<ResetDepartmentEvent>((event, emit) async {
      try {
        emit(DepartmentInitial());
      } catch (e) {
        emit(DepartmentError());
        print("DepartmentError ResetDepartmentEvent erorrrr");
        print(e);
      }
    });
  }
}
