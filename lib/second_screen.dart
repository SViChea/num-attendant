import 'package:flutter/material.dart';
import 'package:num_attendant/main_box_nav.dart';

// Second Page (Edit Page)
class SecondPage extends StatelessWidget {
  final Map<String, dynamic> user;
  const SecondPage({super.key, required this.user});
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
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) =>  MainBottomNav()),
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
                    _infoCard(Icons.account_circle_sharp, "Full Name", user["fullname"] ?? "full name"),
                    SizedBox(height: 15),
                    _infoCard(Icons.work, "Occupation", user["occupation"] ?? "occupation"),
                    SizedBox(height: 15),
                    _infoCard(Icons.email, "Email", user["email"] ?? "user@gmail.com"),
                    SizedBox(height: 15),
                    _infoCard(Icons.phone, "Phone Number", user["phoneNumber"] ?? "+855 XX XXX XXX"),
                    SizedBox(height: 15),
                    _infoCard(
                      Icons.location_on,
                      "Address",
                      user["address"] ?? "#XX, District, City, Postal Code",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(IconData icon, String title, String value) {
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
            controller: TextEditingController(text: value),
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