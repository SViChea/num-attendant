import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, dynamic> user;
  HomeScreen({super.key, required this.user});

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            height:
                MediaQuery.of(context).size.height * 0.75, // 80% screen height
            width: MediaQuery.of(context).size.width * 1, // 80% screen width
            decoration: BoxDecoration(
              color: Color(0xFFF1F2F7), // Custom color
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ), // Rounded corners
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.ltr,
                      children: [
                        Text(
                          "Rank",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 60,
                              width: 170,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1F2F7),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Column(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "In Class",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '${user["rank"]}',
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 60,
                              width: 170,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1F2F7),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Column(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "In Generation",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '${user["generation"]}',
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(height: 15),
                  Container(
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Attendance",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 60,
                              width: 170,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1F2F7),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Column(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Attendance",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 11,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "${user["attendant"]}%",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 60,
                              width: 170,
                              decoration: BoxDecoration(
                                color: Color(0xFFFBE9E8),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Column(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Skips",
                                    style: TextStyle(
                                      color: Color(0xFFDA554C),
                                      fontFamily: "Montserrat",
                                      fontSize: 11,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "${user["dayofabsent"]} Days",
                                    style: TextStyle(
                                      color: Color(0xFFDA554C),
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TableCalendar(
                          firstDay: DateTime(2000),
                          lastDay: DateTime(2100),
                          focusedDay: _focusedDay,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
