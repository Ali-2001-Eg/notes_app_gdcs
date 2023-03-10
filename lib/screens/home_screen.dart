import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_gdcs/screens/note_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var searchController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
                top: screenSize.height / 8,
                left: screenSize.width / 10,
                right: screenSize.width / 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NotePad',
                  style: TextStyle(
                      fontSize: screenSize.height / 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: screenSize.height / 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenSize.height / 25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Search notes',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: screenSize.height / 25,
                    ),
                  ),
                  controller: searchController,
                  onChanged: (value) {},
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) => _listTile(
                    color:index.isEven?const Color(0xffFFFB82) : const Color(0xff82FFB0),
                    context: context,
                    title: 'Todays grocery list',
                    date: 'June 26, 2022 08:05 PM',
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:  (context) => const NoteDetails(),));
          },
          backgroundColor: Colors.amber,
          child: Icon(CupertinoIcons.plus,color: Colors.black,size: screenSize.height/25,),
        ),
      ),
    );
  }

  Widget _listTile({
    required Color color,
    required BuildContext context,
    required String title,
    required String date,
  }) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteDetails(),));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(screenSize.height / 50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.height / 30),
              ),
              Text(
                date,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.height / 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
