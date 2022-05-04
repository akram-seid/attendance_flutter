import 'package:retrofit_flutter/models/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_flutter/home_page.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _passwordVisible = true;
  int currentUser = 0;

  Future<Teacher> login(BuildContext context, String user, String pass) async {
    var url = Uri.parse("http://192.168.1.105:5000/tealogin");
    var response = await http.post(url, body: {
      'username': user,
      'password': pass,
      'table': 'instructors',
    });
    if (response.statusCode == 201) {
      final String responseString = response.body;
       Navigator.push(
          context, MaterialPageRoute(builder: ((context) => const Home())));
       return teacherFromJson(responseString);
     
    } else if (response.statusCode == 422) {
      Fluttertoast.showToast(
          msg: "an Error occured!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SIGNIN"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: username,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your username',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: password,
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        fillColor: Colors.black,
                        labelText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (val) =>
                          val!.length < 6 ? 'Password too short.' : null,
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        login(context, username.text, password.text);
                      },
                      child: const Text('Signin'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ToggleSwitch(
                      borderColor: const [
                        Colors.white,
                      ],
                      initialLabelIndex: 0,
                      totalSwitches: 3,
                      labels: const ['Admin', 'Instructor', 'Student'],
                      onToggle: (index) {
                        currentUser = index!;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
