import 'package:provider/provider.dart';
import 'package:sethcapp/cert_made.dart';
import 'package:sethcapp/constant.dart';
import 'package:sethcapp/editprofile.dart';
import 'package:sethcapp/pages/login.dart';
import 'package:sethcapp/providers/user_provider.dart';
import 'package:sethcapp/util/api.dart';
import 'package:sethcapp/util/app_url.dart';
import 'package:sethcapp/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:sethcapp/pages/dashboard.dart';
import 'package:sethcapp/pages/fab_bottom_app_bar.dart';
import 'package:sethcapp/cert_made.dart';
import 'package:sethcapp/qr_code.dart';
import 'package:sethcapp/pages/place.dart';
import 'package:sethcapp/info_screen.dart';
import 'package:sethcapp/info_rs.dart';
import 'package:sethcapp/history_pass.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'domain/user.dart';

class profile extends StatefulWidget {
  profile({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _cert_profileState createState() => _cert_profileState();
}

class _cert_profileState extends State<profile> {
  String _lastSelected = 'TAB: 0';

  void _logoutDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Confirmation"),
          content: new Text("Are you sure you want to logout?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Logout"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Login(),
                ));
              },
            ),
          ],
        );
      },
    );
  }

  var subtitle;
  void _selectedTab(int index) {
    if (index == 0) {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new DashBoard()));
    } else if (index == 1) {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new cert_made()));
    } else if (index == 2) {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new qr_code()));
    } else if (index == 3) {
      return _logoutDialog();
    }
    print("selectedTab: $index");
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    if (index == 0) {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Place()));
    } else if (index == 1) {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new info_screen()));
    } else if (index == 3) {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new history_pass()));
    } else if (index == 2) {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new info_rs()));
    }
    print("selectedFab: $index");
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  final controller = ScrollController();
  double offset = 0;

  Future<Map<String, dynamic>> getProfile(context) async {
    print('getProfile() called');
    User user = Provider.of<UserProvider>(context, listen: false).user;
    Map<String, String> data = {"username": user.username, "password": user.password};
    var response = await hitApi(AppUrl.getProfile, data);

    return response['profile'];
  }

  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
    getProfile(context).then((listItems) {
      setState(() {
        this.data = listItems;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context, listen: false).user;
    if (this.data == null) {
      return new WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
              key: _keyLoader,
              backgroundColor: Colors.black54,
              children: <Widget>[
                Center(
                  child: Column(children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please Wait....",
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ]),
                )
              ]));
    }
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyHeader(
                image: "assets/icons/Drcorona.svg",
                textTop: "Profile",
                textBottom: "Details",
                offset: offset,
              ),
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(
                      Icons.confirmation_number,
                      color: Colors.blueAccent,
                    ),
                    title: const Text('NIK'),
                    subtitle: Text(this.data['nik']),
                    
                  ),
                  new ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                    ),
                    title: const Text('Name'),
                    subtitle: Text(this.data['name']),
                   
                  ),
                  new ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                    ),
                    title: const Text('Email'),
                    subtitle: Text(this.data['email']),
                   
                  ),
                  // new ListTile(
                  //   leading: const Icon(
                  //     Icons.calendar_today,
                  //     color: Colors.blueAccent,
                  //   ),
                  //   title: const Text('Date of Birth'),
                  //   subtitle: Text(this.data['bday']),
                  // ),
                  new ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                    ),
                    title: const Text('Phone'),
                    subtitle: Text(this.data['phone']),
                   
                  ),
                  new ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                    ),
                    title: const Text('Address'),
                    subtitle: Text(this.data['address']),
                   
                  ),
                  // new ListTile(
                  //   leading: const Icon(
                  //     Icons.person,
                  //     color: Colors.blueAccent,
                  //   ),
                  //   title: const Text('City'),
                  //   subtitle: Text(this.data['city']),
                   
                  // ),
                  // new ListTile(
                  //   leading: const Icon(
                  //     Icons.person,
                  //     color: Colors.blueAccent,
                  //   ),
                  //   title: const Text('Country'),
                  //   subtitle: Text(this.data['country']),
                   
                  // ),
                  // new ListTile(
                  //   leading: const Icon(
                  //     Icons.person,
                  //     color: Colors.blueAccent,
                  //   ),
                  //   title: const Text('Postal Code'),
                  //   subtitle: Text(this.data['postalcode']),
                   
                  // ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // return cert_made();
                            return EditProfile();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return cert_made();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                ],
              ),
            ]),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Info',
        color: Colors.grey,
        selectedColor: Colors.red,
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Certificate'),
          FABBottomAppBarItem(iconData: Icons.settings_overscan, text: 'Scan'),
          FABBottomAppBarItem(iconData: Icons.logout, text: 'Logout'),
        ],
      ),
    );
  }
}
