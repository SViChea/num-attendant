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
  var auth = FirebaseAuth.instance;

  Future<bool> signUpEmailAndPassword(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

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
                      obscureText: true,
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
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                      maxHeight: 55.0,
                    ),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        labelStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF08252E),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
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
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                      maxHeight: 55.0,
                    ),
                    child: TextFormField(
                      controller: _phoneNumber,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
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
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (_passwordController.text ==
                          _confirmPasswordController.text) {
                        final res = await _authentication
                            .signUpEmailAndPassword(
                              _emailAddress.text,
                              _passwordController.text,
                            );

                        _firestoreHelper.createDocumentWithSet(address: "", attendant: 0, dayofabsent: 0, email: _emailAddress.text, fullname: _fullName.text, generation: 0, occupation: "", phoneNumber: _phoneNumber.text, rank: 0, docId: _authentication.getCurrentUserId())
                            .then(
                              (value) => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                    content: const Text(
                                      'User has been added',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                },
                              ),
                            );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      } else {
                        // Show error message (e.g., using SnackBar)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Passwords and Confirm Password do not match',
                            ),
                          ),
                        );

                        _confirmPasswordController.clear();
                        _passwordController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF162534),
                      minimumSize: const Size(double.infinity, 50),
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
