import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/department/department_event.dart';
import 'package:tobeto_app/bloc/department/department_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  DepartmentBloc(
      {FirebaseAuth? firebaseAuth, FirebaseFirestore? firebaseFirestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        super(DepartmentInitial()) {
    on<GetDepartmentX>((event, emit) async {
      try {
        final departmentInfo = await UserRepositories()
            .getDepartmentInfoFromFirebase(event.department);
        emit(DepartmentLoaded(educationDepartmentInfo: event.department));
      } catch (e) {
        emit(DepartmentError());
        print("HatayaDüştü");
        print(e);
      }
    });
  }
}
