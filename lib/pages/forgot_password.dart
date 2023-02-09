import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/pages/home_page.dart';
import 'package:gymsupplimentshop/pages/signup_screen.dart';


class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  final _formKey = GlobalKey<FormState>();

  var email ="";
  final emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }

  forgotPass() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("Password Rest Email has been sent !",style: TextStyle(color: Colors.black),)));
    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("No user found that email !",style: TextStyle(color: Colors.black),)));
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Fitness Center',
          style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.w500),
        ),
        iconTheme: IconThemeData(
          color: Colors.red[700]
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text('Reset Link will be sent to your email id !',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'eg: email12@gmail.com',
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.only(left: 5),
                          ),
                          controller: emailController,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please Enter Email';
                            }
                            else if(!EmailValidator.validate(value)){
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(18),
                            splashColor: Colors.black26,
                            onTap: (){
                              if(_formKey.currentState!.validate()){
                                setState(() {
                                  email = emailController.text;
                                });
                              }
                              forgotPass();
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: ShapeDecoration(
                                  shape: CircleBorder(side: BorderSide.none),
                                  color: Colors.red
                              ),
                              child: Center(child: Icon(Icons.navigate_next)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text( "Don't have an account?"),
                              TextButton(onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                              }, child: Text('Signup',style: TextStyle(fontWeight: FontWeight.bold),))
                            ],

                          )
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}