import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_it/config/logger_config.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

// Future<> signInWithGoogle() async {
//   try {
//     User? user;
//     bool isLoggedIn = await _googleSignIn.isSignedIn();
//     if (isLoggedIn) {
//       user = _auth.currentUser ;
//     } else {
//       final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;
//       // get the credentials to (access / id token)
//       // to sign in via Firebase Authentication
//       final AuthCredential credential = GoogleAuthProvider.getCredential(
//           accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
//       _user = (await _auth.signInWithCredential(credential)).user;
//     }

//     return _user;
//   } catch (err) {
//     appLogNoStack.e(err);
//   }
// }
