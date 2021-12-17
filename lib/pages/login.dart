import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sethcapp/domain/user.dart';
import 'package:sethcapp/providers/auth.dart';
import 'package:sethcapp/providers/user_provider.dart';
import 'package:sethcapp/util/validators.dart';
import 'package:sethcapp/util/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sethcapp/widgets/my_header.dart';
import 'package:sethcapp/providers/user_provider.dart';
import 'package:sethcapp/providers/user_provider.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // TODO: implement initState
    super.initState();
  }


  final formKey = new GlobalKey<FormState>();

  String _username = "", _password = "";

  get image => null;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final usernameField = TextFormField(
      autofocus: false,
      // validator: validateEmail,
      onSaved: (value) => _username = value,
      decoration: buildInputDecoration("Input username", Icons.person_search),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      // validator: (value) => value.isEmpty ? "Please enter password" : null,
      onSaved: (value) => _password = value,
      decoration: buildInputDecoration("Confirm password", Icons.lock),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );

    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.all(0.0),
          child: Text("Forgot password?",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
//            Navigator.pushReplacementNamed(context, '/reset-password');
          },
        ),
        FlatButton(
          padding: EdgeInsets.only(left: 0.0),
          child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
      ],
    );
    var doLogin = () {
      User user = new User(
        username: "cuser0",
        nik: "30919873421",
        email: "cuser0",
        name: 'Bayu Setiawan',
        id: 1,
        phone: '+620123',
        password: "123450",
      );
      Provider.of<UserProvider>(context, listen: false).setUser(user);
      Navigator.pushReplacementNamed(context, '/dashboard');
    };

//       final form = formKey.currentState;

//       if (form.validate()) {
//         form.save();

//         final Future<Map<String, dynamic>> successfulMessage =
//             auth.login(_username, _password);

//         successfulMessage.then((response) {
//           if (response['status']) {
//             User user = response['user'];
//             Provider.of<UserProvider>(context, listen: false).setUser(user);
//             Navigator.pushReplacementNamed(context, '/dashboard');
//           } else {
//             Flushbar(
//               title: "Failed Login",
//               message: response['message']['message'].toString(),
//               duration: Duration(seconds: 3),
//             ).show(context);
//           }
//         });
//       } else {
//         print("form is invalid");
//       }
//     };
//   }
// }
//     final form = formKey.currentState;
//     form.save();

//     if (_username==""){
//       _username = "cuser0";
//       _password = "123450";
//     }

//     final Future<Map<String, dynamic>> successfulMessage = auth.login(_username, _password);

//       successfulMessage.then((response) {
//         print("response: $response");
//         if (response['status']) {
//           print(response);
//           User user = response['user'];
//           Provider.of<UserProvider>(context, listen: false).setUser(user);
//           Navigator.pushReplacementNamed(context, '/dashboard');
//         } else {
//           Flushbar(
//             title: "Failed Login",
//             message: response['message'].toString(),
//             duration: Duration(seconds: 3),
//           ).show(context);
//         }
//       });
//     };

    return Container(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Padding(
            padding: const EdgeInsets.only(top: 60.0),
          child: Center(
            child: Container(
                width: 200,
                height: 150,
                /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                child: Image.asset('assets/images/logo.png')),
          ),
        ),
                SizedBox(height: 15.0),
                label("Username"),
                SizedBox(height: 5.0),
                usernameField,
                SizedBox(height: 20.0),
                label("Password"),
                SizedBox(height: 5.0),
                passwordField,
                SizedBox(height: 20.0),
                auth.loggedInStatus == Status.Authenticating
                    ? loading
                    : longButtons("Login", doLogin),
                SizedBox(height: 5.0),
                forgotLabel
              ],
            ),
          ),
        ),
      );
  }
}
