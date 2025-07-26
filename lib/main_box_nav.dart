import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:num_attendant/account_page.dart';
import 'package:num_attendant/home_screen.dart';
import 'package:num_attendant/login_screen.dart';

class CloudFirestoreHelper {
  var db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getOneDocument(String docId) async {
    Map<String, dynamic> user = {};
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await db.collection('student_information').doc(docId).get();
      user = snapshot.data()!;
      return user;
    } catch (e) {
      print("Error loading user data: $e");
      return {};
    }
  }
}

class MainBottomNav extends StatefulWidget {
  MainBottomNav({super.key});

  @override
  _MainBottomNavState createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  int _selectedIndex = 0;
  late List<Widget> _screens; // Declare but don't initialize yet
  final AuthHelper _authentication = AuthHelper();

  final _firestoreHelper = CloudFirestoreHelper();
  Map<String, dynamic>? user;
  bool isLoading = true;
  String docsId = "";

  @override
  void initState() {
    docsId = _authentication.getCurrentUserId(); // Get the current user's ID
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    final fetchedUser = await _firestoreHelper.getOneDocument(docsId);
    setState(() {
      user = fetchedUser;
      isLoading = false;
      _screens = [
        HomeScreen(user: user!),
        Center(child: Text('Calendar Screen')),
        Center(child: Text('Search Screen')),
        Center(child: Text('Store Screen')),
        AccountScreen(user: user!),
      ];
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _screens = [
  //     HomeScreen(user: widget.user),
  //     Center(child: Text('Calendar Screen')),
  //     Center(child: Text('Search Screen')),
  //     Center(child: Text('Store Screen')),
  //     AccountScreen(user: widget.user),  // Now widget.user is accessible
  //   ];
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF08252E),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Logo copy.png', // Replace with your logo path
              height: 40.0,
              width: 40.0,
            ), // Replace with your emblem
            Container(
              child: Row(
                children: [
                  Icon(Icons.notifications, size: 30, color: Colors.white),
                  Icon(Icons.settings, size: 30, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF08252E),
      body: _screens[_selectedIndex], // ✅ This displays the selected screen
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: const Color(0xFF08252E),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month, size: 30),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront, size: 30),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: 30),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
