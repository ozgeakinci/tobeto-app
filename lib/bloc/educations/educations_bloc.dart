import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/educations/educations_event.dart';
import 'package:tobeto_app/bloc/educations/educations_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class DepartmentBloc extends Bloc<EducationsEvent, EducationsState> {
  DepartmentBloc() : super(EducationsInitial()) {
    on<FetchDepartmentRequested>((event, emit) async {
      try {
        final departmentInfo = await UserRepositories()
            .getDepartmentInfoFromFirebase(event.department);
        print(departmentInfo.lessonList);
        emit(EducationsLoaded(
            educationDepartmenogInfo: departmentInfo.lessonList));
      } catch (e) {
        emit(EducationsError());
        print("DepartmentError FetchDepartmentRequested erorrrr");
        print(e);
      }
    });

    on<ResetDepartmentEvent>((event, emit) async {
      try {
        emit(EducationsInitial());
      } catch (e) {
        emit(EducationsError());
        print("DepartmentError ResetDepartmentEvent erorrrr");
        print(e);
      }
    });
  }
}
