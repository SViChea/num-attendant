import 'package:flutter/material.dart';
import 'package:num_attendant/login_screen.dart';
import 'package:num_attendant/main_box_nav.dart';

// Second Page (Edit Page)

class SecondScreen extends StatefulWidget {
  final Map<String, dynamic>? user;
  SecondScreen({super.key, required this.user});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final CloudFirestoreHelper _firestoreHelper = CloudFirestoreHelper();
  final AuthHelper _authentication = AuthHelper();

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  String docsId = "";

  @override
  void initState() {
    super.initState();
    docsId = _authentication.getCurrentUserId();
    _fullNameController.text = widget.user?["fullname"] ?? "";
    _occupationController.text = widget.user?["occupation"] ?? "";
    _phoneController.text = widget.user?["phoneNumber"] ?? "";
    _addressController.text = widget.user?["address"] ?? "";
    _emailController.text = widget.user?["email"] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF08252E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/profileicon.png', height: 197, width: 197),
                SizedBox(height: 10),
                Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _firestoreHelper.updateWithValue({
                      'fullname': _fullNameController.text,
                      'occupation': _occupationController.text,
                      'email': _emailController.text,
                      'phoneNumber': _phoneController.text,
                      'address': _addressController.text,
                    }, docsId);
                    
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainBottomNav()),
                      (route) => false,
                    );
                  },
                  child: Text('Done'),
                ),
                SizedBox(height: 15),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Color(0xFFF1F2F7),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _infoCard(
                      Icons.account_circle_sharp,
                      "Full Name",
                      _fullNameController,
                    ),
                    SizedBox(height: 15),
                    _infoCard(Icons.work, "Occupation", _occupationController),
                    SizedBox(height: 15),
                    _infoCard(Icons.email, "Email", _emailController),
                    SizedBox(height: 15),
                    _infoCard(Icons.phone, "Phone Number", _phoneController),
                    SizedBox(height: 15),
                    _infoCard(Icons.location_on, "Address", _addressController),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(
    IconData icon,
    String title,
    TextEditingController controller,
  ) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [Icon(icon, size: 20), SizedBox(width: 10), Text(title)],
          ),
          SizedBox(height: 10),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ],
      ),
    );
  }
}
