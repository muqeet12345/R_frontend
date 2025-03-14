import 'package:flutter/material.dart';

class CheckinScreen extends StatefulWidget {
  const CheckinScreen({Key? key}) : super(key: key);

  @override
  _CheckinScreenState createState() => _CheckinScreenState();
}

class _CheckinScreenState extends State<CheckinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back',style:TextStyle(
          color: Colors.deepOrange
        ) ,),
        leading: IconButton(onPressed: () {

                 }, icon: Icon(Icons.arrow_back_ios, color: Colors.deepOrange,)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/cat_dog.jpg',
                  width: 200,  // Adjust width as needed
                  height: 200, // Adjust height as needed
                  fit: BoxFit.cover, // Ensure the image covers the oval shape properly
                ),
              )
          ),
          SizedBox(height: 10,),
          Text('What are you Looking For?',
            style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ) ,),
          Text('Discover people who share your interest!',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          ),
          SizedBox(height: 15,),
          Wrap(
            alignment: WrapAlignment.center, // Center align karega
            spacing: 8, // Horizontal space between buttons
            runSpacing: 8, // Vertical space between lines
            children: [
              _buildingElevatedButton('Friends', context),
              _buildingElevatedButton('Networking', context),
              _buildingElevatedButton('Dates', context),
              _buildingElevatedButton('Food', context),
              _buildingElevatedButton('Parties', context),
              _buildingElevatedButton('Event', context),
              _buildingElevatedButton('Drink', context),
              // Extra button, next line pe shift hoga
            ],
          ),
          SizedBox(height: 240,),
          Padding(padding: EdgeInsets.all(10),
          child:
          SizedBox(
            width: double.infinity,
            height: 50,// Full width
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Lets go!',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
            ),
          )
          )



        ],
      )
    );
  }
}

Widget _buildingElevatedButton(String text, BuildContext context) {
  return ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
            return Colors.white; // White text when pressed or hovered
          }
          return Colors.black; // Default black text
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed) || states.contains(MaterialState.hovered)) {
            return Colors.black; // Black background when pressed or hovered
          }
          return Colors.white; // Default white background
        },
      ),
      side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 2)), // Black outline
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Rounded corners
        ),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
  );
}


