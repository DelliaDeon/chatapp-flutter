import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/textfield.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTap;

  const SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // email and password controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController cpwController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // logo
              Icon(Icons.message, size: 70,
                color: Theme.of(context).colorScheme.secondary,),
              SizedBox(height: 15,),

              // welcome back message
              Text(
                "Let's create an account for you!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15,),


              // email textfield
              MyTextField(
                text: 'Email',
                obscure: false,
                controller: emailController,
              ),
              SizedBox(height: 5,),


              // password textfield
              MyTextField(
                text: 'Password',
                obscure: true,
                controller: pwController,
              ),
              SizedBox(height: 5,),

              // confirm password textfield
              MyTextField(
                text: 'Confirm password',
                obscure: true,
                controller: cpwController,
              ),
              SizedBox(height: 30,),


              // login button
              CustomButton(
                text: 'Create An Account',
                onTap: () async {
                  final _auth = AuthService();

                  // if passwords match, create user
                  if (pwController.text == cpwController.text){
                    try{
                      _auth.signUpWithEmailPw(emailController.text, pwController.text);
                    }

                    // in case of any errors, let user know
                    catch (e) {
                      showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(title: Text(e.toString()),);
                        },
                      );
                    }
                  }

                  // if passwords do not match, let user know.
                  else{
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Passwords do not match"),
                          );
                        }
                    );
                  }
                },
              ),
              SizedBox(height: 32,),


              // register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a member? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Sign In Now",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
          ),
      ),
    );
  }
}
