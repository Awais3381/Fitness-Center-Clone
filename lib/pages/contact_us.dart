import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/pages/cart_page.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';

class Contact_us extends StatefulWidget {
  const Contact_us({Key? key}) : super(key: key);

  @override
  State<Contact_us> createState() => _Contact_usPageState();
}

class _Contact_usPageState extends State<Contact_us> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController messageController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Fitness Center',
          style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Carts()));
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.red[700],
              ),
            ),
          ),
        ],
        iconTheme: IconThemeData(
            color: Colors.red[700]
        ),
      ),
      backgroundColor: const Color(0xfff5f5fd),
      body: Center(
        child: Container(
          height: 450,
          width: 400,
          margin: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: Colors.grey[300]!)
              ]),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('If you have any query then freely',
                    style:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.black)),
                const Text('Contact Us',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.red)),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Required*';
                    }else if (!EmailValidator.validate(email)) {
                      return 'Please enter a valid Email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(hintText: 'Message'),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 45,
                  width: 110,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () async{
                      if (_formkey.currentState!.validate()) {
                        final response = await sendEmail(
                            nameController.value.text,
                            emailController.value.text,
                            messageController.value.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          response == 200
                              ? const SnackBar(
                              content: Text('Message Sent!',style: TextStyle(color: Colors.black),),
                              backgroundColor: Colors.red)
                              : const SnackBar(
                              content: Text('Failed to send message!'),
                              backgroundColor: Colors.red),
                        );
                        nameController.clear();
                        emailController.clear();
                        messageController.clear();
                      }
                    },
                    child: const Text('Send', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future sendEmail(String name, String email, String message) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_w6ox6qi';
    const templateId = 'template_5bqxok9';
    const userId = 'MX6IUex-cQLatDY50';
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},//This line makes sure it works for all platforms.
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'from_name': name,
            'from_email': email,
            'message': message
          }
        })
    );
    print (response.body);
    return response.statusCode;

  }
}


