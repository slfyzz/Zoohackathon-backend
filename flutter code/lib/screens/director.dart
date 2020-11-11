import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Director extends StatefulWidget {
  List<Widget> screens;
  Director(this.screens);

  @override
  _DirectorState createState() => _DirectorState();
}

class _DirectorState extends State<Director> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/panda.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Center(
          child: widget.screens.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.lightGreen[300],
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Community"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notifications"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_business), label: "Adoption"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
