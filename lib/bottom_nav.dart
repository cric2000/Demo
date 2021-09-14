

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:play_lab/dash_content.dart';
import 'package:play_lab/home.dart';



Color bgColor = Color(0xff151515);
Color linkColor = Color(0xff888888);

var _message ;

var _currentDate = DateTime.now().hour;


class Bottom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomState();
  }
}

class _BottomState extends State<Bottom> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    DashContent(Colors.grey),
    DashContent(Colors.blueGrey),
    DashContent(Colors.greenAccent),
  ];
  @override
  Widget build(BuildContext context) {
    if (_currentDate < 12) {
      _message = "Good morning";
    }
    else if (_currentDate < 18) {
      _message = "Good afternoon";
    }
    else {
      _message = "Good evening";
    }
    return Scaffold(
      drawer: SideDrawer(),
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          automaticallyImplyLeading: true,
          title: Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Text("$_message",
              style: TextStyle(
                fontSize: 27,
              ),),
          ),
          leading: Container(
              child: Builder(
                  builder: (context) => IconButton(
                   icon: Icon(Icons.menu_rounded),
                  color: Colors.white,
                    onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
          margin: EdgeInsets.only(top: 16.0),
          ),
          centerTitle: true,
          titleSpacing: 0,
          elevation: 0,
          bottom: PreferredSize(
              child: Container(
                color: Colors.white,
                height: 3.0,
              ),
              preferredSize: Size.fromHeight(3.0)),
          backgroundColor: bgColor,
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28.0,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: bgColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: "Activity",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.chat_bubble),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_sharp),
            label: "User",
          )
        ],

      ),

    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.black, //This will change the drawer background to blue.
        //other styles
      ),
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 350.0,
              child: DrawerHeader(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      Container(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50.0,
                          backgroundImage: AssetImage(
                            "images/winner.png",
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 30.0, 0, 10.0),
                      ),
                      Container(
                        child : Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),

                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 5.0),
              child: ListTile(
                leading: Icon(Icons.notifications_active , color: Colors.white,),
                title: Text('Notifications' , style: TextStyle(
                  color: Colors.white
                ),),
                onTap: () => {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              child: ListTile(
                leading: Icon(Icons.account_balance_wallet , color: Colors.white,),
                title: Text('Wallet',style: TextStyle(
                  color: Colors.white
                ),),
                onTap: () => {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              child: ListTile(
                leading: Icon(Icons.settings , color: Colors.white,),
                title: Text('Settings',style: TextStyle(
                    color: Colors.white
                ),),
                onTap: () => {},
              ),
            ),
          ],
        ),

      ),
    );
  }
}

