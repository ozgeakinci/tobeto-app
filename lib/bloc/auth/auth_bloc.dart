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
        print("------- Giriş Hataları-------- ");
        print(e);
        if (e.code == 'invalid-email') {
          print('E-posta adresi yanlış biçimlendirilmiş.');
          emit(NotAuthenticated(
              errorMessage: 'E-posta adresi yanlış biçimlendirilmiş.'));
        } else if (e.code == 'user-not-found') {
          print('Girilen e-posta adresine sahip kullanıcı bulunamadı.');
          emit(NotAuthenticated(
              errorMessage:
                  'Girilen e-posta adresine sahip kullanıcı bulunamadı.'));
        } else if (e.code == 'wrong-password') {
          print('Girilen parola yanlış.');
          emit(NotAuthenticated(errorMessage: 'Girilen parola yanlış.'));
        } else {
          print('Giriş yapılırken bir hata oluştu: ${e.message}');
          emit(NotAuthenticated(
              errorMessage:
                  'Giriş yapılırken bir hata oluştusaddas: ${e.message}'));
        }
      }
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
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            emit(NotAuthenticated(
                errorMessage: 'The password provided is too weak.'));
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
            emit(NotAuthenticated(
                errorMessage: 'The account already exists for that email.'));
          }
        }
      },
    );

    on<Logout>((event, emit) async {
      await _firebaseAuth.signOut();
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
