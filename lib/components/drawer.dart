import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // logo
                  DrawerHeader(
                    child: Icon(
                      Icons.message,
                      size: 70,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  SizedBox(height: 90,),

                  // home list tile
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text("H O M E"),
                      leading: Icon(Icons.home),
                      onTap: (){
                        // pop the drawer
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  // settings list tile
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      title: Text("S E T T I N G S"),
                      leading: Icon(Icons.settings),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsPage()
                          )
                        );
                      },
                    ),
                  ),

                ],
              ),

              // logout list tile
              Padding(
                padding: EdgeInsets.only(left: 25, bottom: 25),
                child: ListTile(
                  title: Text("L O G O U T"),
                  leading: Icon(Icons.logout),
                  onTap: (){
                    final auth = AuthService();
                    auth.signOut();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
