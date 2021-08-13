import 'package:flutter/material.dart';
import 'package:short_profile/widgets/info_card.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

const url = 'https://github.com/aribushady';
const email = 'arielabushady@gmail.com';
const phone = '+727 238 9731';
const location = 'Saint Petersburg, Florida';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  void _showDialog(BuildContext context, {required String title, required String msg}) {
    final dialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        RaisedButton(
          color:Colors.purple[200],
          onPressed: () {
            Navigator.pop(context);

          },
          child: Text(
            'Close',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/me.jpg'),
            ),
            Text(
              'Ariel Abushady',
              style: TextStyle(
                fontSize: 45.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Caveat',

              ),
            ),
            Text(
              'Software Developer',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.teal[50],
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.teal.shade700,
            ),
            ),
           InfoCard(
               text: phone,
               icon: Icons.phone,
               onPressed: () async {
                 String removeSpaceFromPhoneNumber = phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                 final phoneCall = 'tel:$removeSpaceFromPhoneNumber';
                 if(await launcher.canLaunch(phoneCall)) {
                 await launcher.launch(phoneCall);
                 } else {
                  _showDialog(
                      context,
                      title: 'Sorry',
                      msg: 'Phone number can not be called. Please try again'
                  );
                 }
           }
           ),
            InfoCard(
                text: email,
                icon: Icons.email,
                onPressed: () async{
                  final emailAddress = 'mailto:$email';
                  if(await launcher.canLaunch(emailAddress)) {
                  await launcher.launch(emailAddress);
                  } else {
                    _showDialog(
                        context,
                        title: 'Sorry',
                        msg: 'Email can not send. Please try again.',
                    );
                  }
                }
            ),
            InfoCard(
                text: url,
                icon: Icons.web,
                onPressed: () async{
                  if(await launcher.canLaunch(url)) {
                    await launcher.launch(url);
                  } else {
                    print('Could not launch $url');
                  }
                }
            ),
            InfoCard(
                text: location,
                icon: Icons.location_city,
                onPressed: (){
                  print('location');
                }
            ),


          ],
        ),
      ),
    );
  }
}


