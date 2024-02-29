import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthBloc({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        super(AuthInitial()) {
    print("AuthBloc----AuthInitial-------------------------");

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
      print("AuthBloc----Login-------------------------");

      try {
        UserCredential userCredential =
            await _firebaseAuth.signInWithEmailAndPassword(
                email: event.email, password: event.password);
        emit(Authenticated(user: userCredential.user));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          emit(NotAuthenticated(errorMessage: 'E-posta veya şifre hatalı.'));
        } else {
          emit(NotAuthenticated(
              errorMessage: 'Giriş yapılırken bir hata oluştu.'));
        }
      }
      print("------- Giriş Hataları-------- ");
    });
    on<Register>(
      (event, emit) async {
        print("AuthBloc----Register-------------------------");

        emit(NotAuthenticated());

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
            'applicationStatus': event.applicationstatus,
            'username': event.username,
            'department': event.department,
            'registerDate': DateTime.now(),
            'about': '',
            'phoneNumber': event.phoneNumber
          });
        } on FirebaseAuthException catch (e) {
          String errorMessage = '';
          switch (e.code) {
            case 'email-already-in-use':
              errorMessage =
                  'Girilen e-posta adresine sahip kullanıcı zaten mevcut';
              break;

            case 'weak-password':
              errorMessage = 'Zayıf şifre: Şifre 6 karakterden az olmamalı';
              break;
            default:
              errorMessage =
                  'Giriş yapılırken bir hata oluştu: ${errorMessage.isEmpty ? e.message : errorMessage}';
              break;
          }
          emit(NotAuthenticated(errorMessage: errorMessage));
        }
      },
    );

    on<Logout>((event, emit) async {
      await _firebaseAuth.signOut();
      emit(NotAuthenticated());
    });

    on<ResetPassword>((event, emit) async {
      try {
        await _firebaseAuth.sendPasswordResetEmail(email: event.email);
        emit(PasswordResetEmailSent());
      } catch (e) {
        emit(PasswordResetError(errorMessage: e.toString()));
      }
    });
  }
}
