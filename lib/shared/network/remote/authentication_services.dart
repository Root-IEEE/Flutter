class AuthenticationServices {
  // Future handleGoogleSignIn() async {
  //   try {
  //     AuthCredential credential;
  //     final GoogleSignInAccount googleUser = await _googleSignIn.signIn().catchError((e) {
  //       throw e;
  //     });
  //     await googleUser.authentication.then((onValue) async {
  //       credential = GoogleAuthProvider.getCredential(
  //         accessToken: onValue.accessToken,
  //         idToken: onValue.idToken,
  //       );
  //       _firebaseUser = await _auth.signInWithCredential(credential);
  //     });
  //     print("signed in " + _firebaseUser.displayName);
  //   } on PlatformException catch (e) {
  //     print(e.toString());
  //   }
  // }

  AuthenticationServices() : super() {}

  Future<bool> isLoggedIn() async {
    return true;
  }

  Future _userType() async {}

  Future emailPasswordRegister(
      String email, String password, String schoolCode) async {
    // await sharedPreferencesHelper.clearAllData();
  }

  Future emailPasswordSignIn(
      String email, String password, userType, String schoolCode) async {}

  logoutMethod() async {}

  Future passwordReset(String email) async {}
}
