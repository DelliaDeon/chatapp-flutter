import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // email and password controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // logo
              Icon(Icons.message, size: 70,
                color: Theme.of(context).colorScheme.secondary,),
              SizedBox(height: 25,),

              // welcome back message
              Text(
                "Welcome back, you've been missed",
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
              SizedBox(height: 30,),


              // login button
              CustomButton(
                text: 'Sign In',
                onTap: () async{
                  // link to auth service
                  final authService = AuthService();

                  // try to login
                  try{
                    await authService.signInWithEmailPw(emailController.text, pwController.text);
                  }

                  // catch any errors
                  catch (e){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(e.toString()),
                      )
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
                    "Not a member? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register Now",
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
