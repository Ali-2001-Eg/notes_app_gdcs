import 'package:flutter/material.dart';

class NoteDetails extends StatelessWidget {
  const NoteDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
                color: Colors.amber, size: screenSize.height / 30),
            elevation: 0,
            title: Text(
              'Note',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenSize.height / 25,
                  color: Colors.black),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ],
            toolbarHeight: screenSize.height / 11,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenSize.height / 35,
                ),
                _noteDate(
                  context: context,
                  date: 'June 26, 2022 08:05 PM',
                ),
                SizedBox(
                  height: screenSize.height / 30,
                ),
                Text(
                  'Title',
                  style: TextStyle(
                      fontSize: screenSize.height / 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: screenSize.height / 35,
                ),
                Text(
                  'Note something down',
                  style: TextStyle(
                      fontSize: screenSize.height / 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_outlined)),
                label: 'Album',
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.today_outlined), label: 'To-do list'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.alarm_add), label: 'Reminder'),
            ],
            iconSize: screenSize.height / 40,
            backgroundColor: Colors.grey[300],
            elevation: 0,
          )),
    );
  }

  Widget _noteDate({
    required String date,
    required BuildContext context,
  }) {
    var screenSize = MediaQuery.of(context).size;
    return Text(
      date,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: screenSize.height / 50),
    );
  }
}
