import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobnow_users/screens/employer/employer_home.dart';
import 'package:jobnow_users/selections.dart';
import 'package:http/http.dart' as http;

import 'jobseeker_home.dart';

class JobseekerLogin extends StatefulWidget {
  const JobseekerLogin({ Key? key }) : super(key: key);

  @override
  _JobseekerLoginState createState() => _JobseekerLoginState();
}

class _JobseekerLoginState extends State<JobseekerLogin> {
  var nameController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFAB47BC),
                    Color(0xFFE1BEE7),
                    Color(0xFFAB47BC),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0,2),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black87
                                  ),
                                  hintText: 'Name',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0,2),
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextFormField(
                              controller: passController,
                              obscureText: true,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black87,
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Colors.black38
                                  )
                              )
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: (){
                          login();
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    buildSignUpBtn(context)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> login() async {
    if(passController.text.isNotEmpty && nameController.text.isNotEmpty){
      var response = await http.post(Uri.parse("http://192.168.0.136:8000/api/jobseeker_login"),
          body: ({
            'name':nameController.text,
            'password':passController.text,
          }));
      if(response.statusCode==201){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => JobseekerHome()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:
            Text("Invalid Credentials")));
      }
    } else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blank Fields Not Allowed")));
    }
  }
}


Widget buildSignUpBtn(BuildContext context){
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SelectPosition(),
          )
      );
    },
    child: RichText(
      text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
            ),
            TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )
            )
          ]
      ),
    ),
  );
}