import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificiationId;
  FirebaseAuth auth = FirebaseAuth.instance;

  PhoneAuthCubit() : super(PhoneAuthInitial());

//1 function

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(Loading());

    await auth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print("verificationFailed : ${error.toString()}");
    emit(ErrorOccurred(errorMsg: error.toString()));
  }

  void codeSent(String verificiationId, int? resendToken) {
    print("CodeSend");
    this.verificiationId = verificiationId;

    emit(phoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print("codeAutoRetrievalTimeout");
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificiationId, smsCode: otpCode);

    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await auth.signInWithCredential(credential);
      emit(phoneOTPVerified());
    } catch (e) {
      emit(ErrorOccurred(errorMsg: e.toString()));
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = auth.currentUser!;
    return firebaseUser;
  }
}
