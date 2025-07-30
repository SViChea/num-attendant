import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:num_attendant/login_screen.dart';
import 'package:num_attendant/main_box_nav.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  _SignUpState createState() => _SignUpState();
}

class AuthHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> signUpEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.sendEmailVerification();
      print("Verification email sent to ${userCredential.user?.email}");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  String getCurrentUserId() {
    return auth.currentUser?.uid ?? '';
  }
}

class _SignUpState extends State<SignUp> {
  final AuthHelper _authentication = AuthHelper();
  final CloudFirestoreHelper _firestoreHelper = CloudFirestoreHelper();

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
    bool _isLoading = false;

  void _showLoadingDialog() {
    setState(() {
      _isLoading = true;
    });
    showDialog(
      context: context,
      barrierDismissible: false, // User must wait for operation to complete
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
    );
  }

    void _hideLoadingDialog() {
    if (_isLoading) {
      Navigator.of(context, rootNavigator: true).pop(); // Dismisses the dialog
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF162534),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [],
          ),
          const SizedBox(height: 30),
          Image.asset(
            'assets/Logo copy.png',
            width: 124,
            height: 124,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 25),
          const Text(
            "WELCOME NUM Attendance",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.99,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(80.0)),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  const Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: Color(0xFF08252E),
                      fontSize: 34,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                      maxHeight: 55.0,
                    ),
                    child: TextFormField(
                      controller: _fullName,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        labelStyle: const TextStyle(
                          color: Color(0xFF08252E),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal,
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFF08252E),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF08252E),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      style: const TextStyle(color: Color(0xFF08252E)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                      maxHeight: 55.0,
                    ),
                    child: TextFormField(
                      controller: _emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        labelStyle: const TextStyle(
                          color: Color(0xFF08252E),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal,
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFF08252E),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF08252E),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      style: const TextStyle(color: Color(0xFF08252E)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                      maxHeight: 55.0,
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF08252E),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFF08252E),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xFF08252E),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF08252E),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () async {
                        _showLoadingDialog(); // Show loading indicator

                        // Attempt to sign up the user and send verification email
                        final bool signUpSuccess = await _authentication.signUpEmailAndPassword(
                          _emailAddress.text,
                          _passwordController.text,
                        );

                        if (signUpSuccess) {
                          final String? userId = _authentication.getCurrentUserId();

                          if (userId != null && userId.isNotEmpty) {
                            // Create a document for the new user in Firestore
                            try {
                              await _firestoreHelper.createDocumentWithSet(address: "", attendant: 0, dayofabsent: 0, email: _emailAddress.text, fullname: _fullName.text, generation: 0, occupation: "", phoneNumber: "", rank: 0, docId: _authentication.getCurrentUserId());

                              _hideLoadingDialog(); // Hide loading indicator

                              // Show success message and prompt for email verification
                              showDialog(
                                context: context,
                                barrierDismissible: false, // User must acknowledge
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15), // Rounded corners
                                    ),
                                    title: const Text(
                                      'Registration Successful!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    content: Text(
                                      'A verification email has been sent toR. Please verify your email address to log in.',
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // Dismiss dialog
                                          Navigator.pushReplacement( // Go to login page
                                            context,
                                            MaterialPageRoute(builder: (context) => LoginPage()),
                                          );
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } catch (e) {
                              _hideLoadingDialog(); // Hide loading indicator
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Failed to save user data: $e'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              // Optionally, delete the Firebase Auth user if Firestore save fails
                              // await FirebaseAuth.instance.currentUser?.delete();
                            }
                          } else {
                            _hideLoadingDialog(); // Hide loading indicator
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Sign up successful, but user ID not found.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } else {
                          _hideLoadingDialog(); // Hide loading indicator
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sign up failed. Please check your credentials.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF162534),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
