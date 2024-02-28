import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/educations/educations_event.dart';
import 'package:tobeto_app/bloc/educations/educations_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class EducationsBloc extends Bloc<EducationsEvent, EducationsState> {
  EducationsBloc() : super(EducationsInitial()) {
    on<FetchEducationsRequested>((event, emit) async {
      emit(EducationsLoading());
      try {
        final departmentInfo = await UserRepositories()
            .getDepartmentInfoFromFirebase(event.department);
        print(departmentInfo.lessonList);
        emit(EducationsLoaded(
            educationDepartmenogInfo: departmentInfo.lessonList));
      } catch (e) {
        emit(EducationsError());
      }
    });

    on<ResetEducationsEvent>((event, emit) async {
      try {
        emit(EducationsInitial());
      } catch (e) {
        emit(EducationsError());
      }
    });
  }
}
