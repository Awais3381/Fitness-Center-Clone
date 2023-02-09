import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/pages/signin_screen.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController usernameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final usernameField= TextFormField(
      controller: usernameController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (value){
        usernameController.text=value!;
      },
      validator: (value){
        if(value!.isEmpty){
          return 'Enter UserName';
        }
        else{
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'eg: Awais Hussain',
        border: UnderlineInputBorder(),
        contentPadding: EdgeInsets.only(left: 5)
      ),
    );

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
          contentPadding: EdgeInsets.only(left: 5)
      ),
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
          contentPadding: EdgeInsets.only(left: 5)
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Stack(
            children: <Widget>[
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(200),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170),
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
          Padding(
            padding: EdgeInsets.only(top: 40,left: 20),
            child: InkWell(
              splashColor: Colors.red,
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> SignIn()));
              },
              child:Icon(
                  Icons.arrow_back,color: Colors.red,size: 25,)
              ),
          ),
              Container(
                margin: EdgeInsets.only(top: 350,left: 25,right: 25),
                height: 375,
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
                      child: Text('Register',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 17,left: 25),
                      child: Text('UserName'),
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        child: usernameField,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 24,left: 25),
                      child: Text('Email'),
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        child: emailField,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 24,left: 25),
                      child: Text('Password'),
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        child: passwordField,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 730,left: 180),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  splashColor: Colors.black26,
                  onTap: (){
                    signup(emailController.text,passwordController.text);
                    print(emailController.text);
                    print(passwordController.text);
                    usernameController.clear();
                    emailController.clear();
                    passwordController.clear();
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
            ],
          ),
        ),
      ),
    );
  }
  void signup(String email,String password) async{
    if(_formkey.currentState!.validate()){
      await auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((uid) =>
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()))
      ).catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("Register Unsuccessfully",style: TextStyle(color: Colors.black),)));
      }
      );
    }
  }
}
