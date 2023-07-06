import 'package:flutter/material.dart';

class EquipeDetails extends StatefulWidget {
  const EquipeDetails({Key? key}) : super(key: key);

  @override
  State<EquipeDetails> createState() => _EquipeDetailsState();
}

class _EquipeDetailsState extends State<EquipeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height/3,
          ),

           Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 40,
                child: Image.asset("assets/images/user.png"),
              ),
            ),


        ],
      ),
    );
  }
}
