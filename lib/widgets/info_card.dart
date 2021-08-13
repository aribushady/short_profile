import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  InfoCard({required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.teal.shade50,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.purple.shade700,
          ),
          title: Text(
            text,
            style:TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.0,
              color: Colors.purple.shade700,

            ),
          ),
        ),
      ),
    );
  }
}
