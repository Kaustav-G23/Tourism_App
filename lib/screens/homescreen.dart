import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/widgets/destination_carousel.dart';
import 'package:tourism_app/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  final String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async{
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  // int _selectedIndex = 0;
  // // int _currentTab = 0;
  // List<IconData> _icons = [
  //   FontAwesomeIcons.plane,
  //   FontAwesomeIcons.bed,
  //   FontAwesomeIcons.parachuteBox,
  //   FontAwesomeIcons.biking,
  // ];

  // Widget _buildIcon(int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         _selectedIndex = index;
  //       });
  //     },
  //     child: Container(
  //       height: 60.0,
  //       width: 60.0,
  //       decoration: BoxDecoration(
  //         color: _selectedIndex == index
  //             ? Theme.of(context).accentColor
  //             : Color(0xFFE7EBEE),
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       child: Icon(
  //         _icons[index],
  //         size: 25.0,
  //         color: _selectedIndex == index
  //             ? Theme.of(context).primaryColor
  //             : Color(0XFFB4C1C4),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/Compass.jpg'),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 20.0, right: 120.0),
            //   child: Text(
            //     "What would you like to find?",
            //     style: TextStyle(
            //       fontSize: 30.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: _icons
            //       .asMap()
            //       .entries
            //       .map(
            //         (MapEntry map) => _buildIcon(map.key),
            //   )
            //       .toList(),
            // ),


            SizedBox(
              height: 20.0,
            ),
            DestinationCarousel(),
            SizedBox(
              height: 20.0,
            ),
            HotelCarousel(),
          ],
        ),
      ),
    );
  }
}
