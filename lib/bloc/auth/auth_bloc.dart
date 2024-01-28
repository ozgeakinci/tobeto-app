import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/bloc/auth/auth_state.dart';
import 'package:tobeto_app/repositories/user_repositories.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthBloc({FirebaseAuth? firebaseAuth, FirebaseFirestore? firebaseFirestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        super(InitialState()) {
    _firebaseAuth.authStateChanges().listen(
      (user) {
        if (user != null) {
          emit(Authenticated(user: user));
        } else {
          emit(NotAuthenticated());
        }
      },
    );
    on<Login>((event, emit) async {
      try {
        UserCredential userCredential =
            await _firebaseAuth.signInWithEmailAndPassword(
                email: event.email, password: event.password);
        emit(Authenticated(user: userCredential.user));
      } on FirebaseAuthException catch (e) {
        emit(NotAuthenticated(errorMessage: e.message));
      }
    });
    on<Register>(
      (event, emit) async {
        try {
          UserCredential userCredential =
              await _firebaseAuth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          await _firebaseFirestore
              .collection("users")
              .doc(userCredential.user!.uid)
              .set({
            'email': event.email,
            'username': event.username,
            'registerDate': DateTime.now()
          });
        } on FirebaseAuthException catch (e) {}
      },
    );

/*     on<ResetAuthEvent>((event, emit) {
      emit(InitialState());
    }); */

    on<GetUserEvent>((event, emit) async {
      try {
        final userInfos = await UserRepositories().getUserInfoFromFirebase();
        print("Veriler Çekildii");
        print(userInfos.username);
        emit(GetUserState(usernameState: userInfos.username));
      } catch (e) {
        emit(GetUserState(usernameState: "No name")); // Degişecek
        print("HatayaDüştü");
        print(e);
      }
    });

    on<Logout>((event, emit) async {
      await _firebaseAuth.signOut();
    });
  }
}
