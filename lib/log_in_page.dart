import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/HomePage.dart';
import 'package:untitled1/home_page.dart';
import 'package:untitled1/widgets/button.dart';
import 'utitlies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailcontroller =TextEditingController();
    final TextEditingController passwordController = TextEditingController();


    return Scaffold(
      appBar: AppBar(title: Text("Log In page",style: TextStyle(
        fontWeight: FontWeight.bold,
          fontSize: 30
      ),
      )
        ,backgroundColor: Colors.lightBlueAccent,
        centerTitle: true ,

    ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(8.0),
                child:
                TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(labelText: "Email: ",labelStyle:TextStyle(fontSize:20),),
                  validator: (value){
                    if (value!.contains("@")){
                      return null;
                    }else{
                      return "not valid email";
                    }
                  },),),
              Padding(padding: const EdgeInsets.all(8.0),
                child:
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "password",labelStyle:TextStyle(fontSize:20),),
                  validator: (value){
                    if (value!.length>7){
                      return null;
                    }else{
                      return "password should contain 8 characters";
                    }
                  },),),
              InkWell(
                onTap: ()async {
                  if(_formKey.currentState!.validate()){
                  bool log_result = await signinUsingFirebase(emailcontroller.text, passwordController.text);
                  if (log_result==true) {
                    saveEmail(emailcontroller.text);
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          HomaPage(email: emailcontroller.text,)),);
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("log in failed")));
                  }
                };
                },
                  child: Center(child:  BuTton(word: 'Login',),),
                ),]


            ,)
          ),
        ),
      );

  }
  saveEmail(String email)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);

  }
  Future<bool> signinUsingFirebase(String email, String password) async {
    bool result =false;
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;

      if (user != null){
        print(user?.uid);
        saveEmail(user!.email!);
        result =true;
       // return result;
      }
      return result;
    } catch(e){
      return result;
    }
  }
}
