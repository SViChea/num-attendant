import 'package:flutter/material.dart';
import 'package:num_attendant/second_screen.dart';

class AccountScreen extends StatelessWidget {
  // You may want to pass docId as a parameter to this widget
  final Map<String, dynamic> user;
  AccountScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/profileicon.png',
                        height: 197,
                        width: 197,
                      ),
                      SizedBox(height: 18),
                      Text(
                        '${user["fullname"]}',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${user!["occupation"]}',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondScreen(user: user),
                            ),
                          );
                        },
                        child: Text('Edit'),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F2F7),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _infoCard(
                          Icons.email,
                          "Email",
                          user?["email"] ?? "user@gmail.com",
                        ),
                        SizedBox(height: 15),
                        _infoCard(
                          Icons.phone,
                          "Phone Number",
                          user?["phoneNumber"] ?? "+855 XX XXX XXX",
                        ),
                        SizedBox(height: 15),
                        _infoCard(
                          Icons.location_on,
                          "Address",
                          user?["address"] ??
                              "#XX, District, City, Postal Code",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }

  // Reusable Widget for displaying user info
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
          Text(value),
        ],
      ),
    );
  }
}
