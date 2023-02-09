import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/pages/forgot_password.dart';
import 'package:gymsupplimentshop/pages/home_page.dart';
import 'package:gymsupplimentshop/pages/signup_screen.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    final emailField=TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (value){
        emailController.text=value!;
      },
      validator: (value){
        if(value!.isEmpty){
          return 'Enter Email';
        }
        else if(!EmailValidator.validate(value)){
          return 'Please enter a valid email';
        }
        else{
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'eg: abc@gmail.com',
        border: UnderlineInputBorder(),
        contentPadding: EdgeInsets.only(left: 5),
    )
    );


    final passwordField = TextFormField(
      controller: passwordController,
      autofocus: false,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      onSaved: (value){
        passwordController.text=value!;
      },

      validator: (value){
        if(value!.isEmpty){
          return 'Enter Password';
        }
        else if(value.length <6){
          return 'Password Must be 6 Digit';
        }
        else{
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: '****',
        border: UnderlineInputBorder(),
        contentPadding: EdgeInsets.only(left: 5),
      ),
      );

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90)
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 225),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'images/logo.png',
                        ),
                      ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 410,left: 25,right: 25),
                height: 270,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 25),
                      child: Text('Login',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 17,left: 25),
                      child: Text('Email'),
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        child: emailField,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10,left: 25),
                      child: Text('Password'),
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        child: passwordField,
                      ),
                    )

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 690,left: 320),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  splashColor: Colors.black26,
                  onTap: (){
                    signIn(emailController.text,passwordController.text);
                    //
                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    //              HomePage()), (Route<dynamic> route) => false);
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 680,left: 25),
                child: FlatButton(
                  onPressed: (){
                   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => forgotPassword()));
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => forgotPassword()));
                  },
                  child: Text('Forgot Password?',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 770),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New User? ',style: TextStyle(color: Colors.black,fontSize: 15),),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text('SignUp',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid) =>
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              HomePage()), (Route<dynamic> route) => false),
      ).catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("Invalid Email/Password",style: TextStyle(color: Colors.black),)));
      }
      );
    }
  }

}