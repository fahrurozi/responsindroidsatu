import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:sethcapp/cert_made.dart';
import 'package:sethcapp/constant.dart';
import 'package:sethcapp/domain/user.dart';
import 'package:sethcapp/profile.dart';
import 'package:sethcapp/providers/auth.dart';
import 'package:sethcapp/providers/user_provider.dart';
import 'package:sethcapp/util/api.dart';
import 'package:sethcapp/util/app_url.dart';
import 'package:sethcapp/util/validators.dart';
import 'package:sethcapp/util/widgets.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = new GlobalKey<FormState>();

  String _email, _name, _phone, _address;

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
    getProfile(context).then((listItems) {
      setState(() {
        this.data = listItems;
      });
    });
  }

  void _editProfile() async{
      User user = Provider.of<UserProvider>(context, listen: false).user;
      print('DEBUGGG' + this.data['id'].toString());
      var response = await hitAPIPatch(AppUrl.editProfile, {
        "username": user.username,
        "password": user.password,
        "new_auth": {
          "username": user.username,
          "password": user.password,
        },
        "new_profile": {
          "email" : _email,
          "name" : _name,
          "phone" : _phone,
          "address" : _address,
        }
      });


      if (response['success'] == true) {
        // Show success message
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => profile(),
        ));
        Flushbar(
          title: "Success",
          message: "Profile updated successfully",
          duration: Duration(seconds: 3),
        )..show(context);
      }
      //else {
      //   return false;
      // }
  }

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    // AuthProvider auth = Provider.of<AuthProvider>(context);

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

    final emailField = TextFormField(
      initialValue: this.data['email'],
      autofocus: false,
      onSaved: (value) => _email = value,
      decoration: buildInputDecoration("Confirm Email", Icons.person_search),
    );

    final nameField = TextFormField(
      initialValue: this.data['name'],
      autofocus: false,
      onSaved: (value) => _name = value,
      decoration: buildInputDecoration("Fill Name", Icons.person),
    );
  
    final phoneField = TextFormField(
      initialValue: this.data['phone'],
      autofocus: false,
      onSaved: (value) => _phone = value,
      decoration: buildInputDecoration("Fill Phone", Icons.phone),
    );

    final addressField = TextFormField(
      initialValue: this.data['address'],
      autofocus: false,
      onSaved: (value) => _address = value,
      decoration: buildInputDecoration("Fill NIK", Icons.poll_rounded)
    );

    // final emailField = TextFormField(
    //   autofocus: false,
    //   onSaved: (value) => _email = value,
    //   decoration: buildInputDecoration("Fill Email", Icons.email),
    // );

    // final phoneField = TextFormField(
    //   autofocus: false,
    //   onSaved: (value) => _phone = value,
    //   decoration: buildInputDecoration("Fill Email", Icons.phone),
    // );

    // var loading = Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     CircularProgressIndicator(),
    //     Text(" EditProfileing ... Please wait")
    //   ],
    // );

    // var doEditProfile = () {
    //   final form = formKey.currentState;
    //   if (form.validate()) {
    //     form.save();
    //     auth.EditProfile(_username, _password, _confirmPassword, _nik).then((response) {
    //       print('response: $response');
    //       if (response['status']) {
    //         var data = response['data'];
    //         print('userData: ${data.toString()}');
    //         // User userData = data;
    //         User user = new User(nik: data.nik, username: data.username, password: data.password);
    //         print('setUser...');
    //         Provider.of<UserProvider>(context, listen: false).setUser(user);
    //         print('dashboard...');
    //         Navigator.pushReplacementNamed(context, '/dashboard');
    //       } else {
    //         Flushbar(
    //           title: "Registration Failed",
    //           message: response.toString(),
    //           duration: Duration(seconds: 10),
    //         ).show(context);
    //       }
    //     });
    //   } else {
    //     Flushbar(
    //       title: "Invalid form",
    //       message: "Please Complete the form properly",
    //       duration: Duration(seconds: 10),
    //     ).show(context);
    //   }
    // };

    return Container(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Center(
                    child: Container(
                        width: 150,
                        height: 50,
                        // child: Image.asset('assets/images/logo.png')
                        ),
                  ),
                ),
                Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15.0),
                label("Email"),
                SizedBox(height: 5.0),
                emailField,
                SizedBox(height: 15.0),
                label("Name"),
                SizedBox(height: 5.0),
                nameField,
                SizedBox(height: 15.0),
                label("Phone"),
                SizedBox(height: 10.0),
                phoneField,
                SizedBox(height: 15.0),
                label("Address"),
                SizedBox(height: 10.0),
                addressField,
                SizedBox(height: 15.0),
                // label("E-mail"),
                // SizedBox(height: 5.0),
                // emailField,
                // SizedBox(height: 15.0),
                // label("Phone"),
                // SizedBox(height: 5.0),
                // phoneField,
                // SizedBox(height: 15.0),
//button edit profile center
                SizedBox(height: 15.0),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      formKey.currentState.save();
                      _editProfile();
                      },
                  ),
                ),
                SizedBox(height: 15.0),
                SizedBox(height: 15.0),
               GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return profile();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // color: kPrimaryColor,        
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
            



                // SizedBox(height: 15.0),
                // RaisedButton(
                //   // onPressed: doEditProfile,
                //   child: Text("Edit Profile"),
                //   color: Colors.blue,
                //   textColor: Colors.white,
                // ),

                // auth.loggedInStatus == Status.Authenticating
                //     ? loading
                //     : longButtons("EditProfile", doEditProfile),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
